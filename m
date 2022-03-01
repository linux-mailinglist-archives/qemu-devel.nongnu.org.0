Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FD64C8668
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 09:23:43 +0100 (CET)
Received: from localhost ([::1]:51250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOxnK-0002bZ-9x
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 03:23:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nOxlT-0001vM-PA
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:21:47 -0500
Received: from [2607:f8b0:4864:20::636] (port=38558
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nOxlS-0004Qa-9V
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:21:47 -0500
Received: by mail-pl1-x636.google.com with SMTP id h17so7292690plc.5
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 00:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UqCm81JbhomjZCV7ZZdgUlA9LcCMHG4fOELPrl/Urmw=;
 b=H4P+oY1ZKOR+tkn149CxWGm3OeaoLSTPijTKdmpHa2HTzteKyWLF+cGkNLkh2iBwaT
 BC9iV5tJMOjcNmFas3CoA2Oo3gVJ2hF1jweY2x8K4EWDBb1NVrL3tMYBdTkkEm7trfHS
 Pcpc3YNA3BSW5mjsiDhhLwn4UHfUVQUQ2Z3Zdx7/hc7Pm7hUk37cHhVdAOcWprp506st
 0WGfEDGqSFiWRlNLOcDcPqn9GGZ90Swo/i6azHRH8DOg1HUnLCzHFRnkqPOnmM1tU74F
 htG+nplT00ynQdKAokN9JlUsjWzMyNQ078cIuvImdWF/15gqgedGxrkTFwhSbb2PrtTe
 RT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UqCm81JbhomjZCV7ZZdgUlA9LcCMHG4fOELPrl/Urmw=;
 b=qL07P+c2baCxnaz4Jyi7WMDYyEPLQaZut54FAcvdOcybOEPqDWsSJv0AIMg12AZHxs
 u+N+j4lNpQtu9HnQlygd8kWdc+xlu1snHR53BS/XUa7XhxjgzfiQ+nCniKvx8icwrrV1
 VZm+R+NxBIJ03fTJ/JzUMTewNaVVHea4Fv6EKgNM27X3+gIt5oG36QyGVsLHE8+GqMGu
 fzymGNE9YIcgTuw9Wb1sksU0rOO2E73JCepEnhW46IPAfMTzT02FdCu6Eg/1ez4qZ33i
 0WQuNbIO1q37lj2fiuYi+Qk9DfV8P7/aba9vEjWVLka+GZP4BV/iXKSPTi+PX2YLWMIo
 tS0Q==
X-Gm-Message-State: AOAM5320jJwDKoJLmco7jDjA2vJFh0o1lddBLoS/8LmJ2Plv+ljmGE/B
 VmRgJdghpIROwa0kV+AxyzE=
X-Google-Smtp-Source: ABdhPJxtFPyO2rE8BAN+2GXs9EKeFRA2zGQTxCkClswbVfB64DQKRghY3J/tpyxZxLZRIP52HAuIlg==
X-Received: by 2002:a17:902:9a48:b0:14f:a377:ee7e with SMTP id
 x8-20020a1709029a4800b0014fa377ee7emr24485303plv.3.1646122904796; 
 Tue, 01 Mar 2022 00:21:44 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 my6-20020a17090b4c8600b001bc2cb011dasm1495398pjb.4.2022.03.01.00.21.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 00:21:44 -0800 (PST)
Message-ID: <e5302fba-e773-c56d-388f-a3593bacd977@gmail.com>
Date: Tue, 1 Mar 2022 17:21:40 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v15 3/8] net/vmnet: implement shared mode (vmnet-shared)
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>,
 Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
References: <20220225171402.64861-1-Vladislav.Yaroshchuk@jetbrains.com>
 <20220225171402.64861-4-Vladislav.Yaroshchuk@jetbrains.com>
 <50a27646-ce9c-c702-965f-46b602be9220@gmail.com>
 <CAGmdLqQ8J+-sK=Huh-G8w-S0RQUEyKkN2rb6PsZAFXbd6Jk2EQ@mail.gmail.com>
 <f839edfc-de5f-7002-4916-21c541a5185b@gmail.com>
 <CAGmdLqRVtJN8YoxfeCYuay-k+RVofM8W=wicn0fRdjau0uwCHQ@mail.gmail.com>
 <CAMVc7JVnxNTMhked8x=Z0baY2ApMKwB8FrESYWQjm43-6Wm+3A@mail.gmail.com>
 <CAGmdLqQhd9q9VQUKEd_hb9rnb2HwrdAv31aB67sUj_=jiLX_Sw@mail.gmail.com>
 <7b4e06fe-4d10-0870-5d6e-d2e70d7eb3a2@gmail.com>
 <CAGmdLqTqcESsiyTMavKZ3U8=5yPtqdq2tunZTH-tfrzwfUMGug@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CAGmdLqTqcESsiyTMavKZ3U8=5yPtqdq2tunZTH-tfrzwfUMGug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, phillip.ennen@gmail.com,
 qemu Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Phillip Tennen <phillip@axleos.com>,
 Roman Bolshakov <roman@roolebo.dev>, Howard Spoelstra <hsp.cat7@gmail.com>,
 Alessio Dionisi <hello@adns.io>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/03/01 17:09, Vladislav Yaroshchuk wrote:
>      > Not sure that only one field is enough, cause
>      > we may have two states on bh execution start:
>      > 1. There are packets in vmnet buffer s->packets_buf
>      >      that were rejected by qemu_send_async and waiting
>      >      to be sent. If this happens, we should complete sending
>      >      these waiting packets with qemu_send_async firstly,
>      >      and after that we should call vmnet_read to get
>      >      new ones and send them to QEMU;
>      > 2. There are no packets in s->packets_buf to be sent to
>      >      qemu, we only need to get new packets from vmnet
>      >      with vmnet_read and send them to QEMU
> 
>     In case 1, you should just keep calling qemu_send_packet_async.
>     Actually
>     qemu_send_packet_async adds the packet to its internal queue and calls
>     the callback when it is consumed.
> 
> 
> I'm not sure we can keep calling qemu_send_packet_async,
> because as docs from net/queue.c says:
> 
> /* [...]
>   * If a sent callback is provided to send(), the caller must handle a
>   * zero return from the delivery handler by not sending any more packets
>   * until we have invoked the callback. Only in that case will we queue
>   * the packet.
>   *
>   * If a sent callback isn't provided, we just drop the packet to avoid
>   * unbounded queueing.
>   */
> 
> So after we did vmnet_read and read N packets
> into temporary s->packets_buf, we begin calling
> qemu_send_packet_async. If it returns 0 - it says
> "no more packets until sent_cb called please".
> At this moment we have N packets in s->packets_buf
> and already queued K < N of them. But, packets K..N
> are not queued and keep waiting for sent_cb to be sent
> with qemu_send_packet_async.
> Thus when sent_cb called, we should finish
> our transfer of packets K..N from s->packets_buf
> to qemu calling qemu_send_packet_async.
> I meant this.

I missed the comment. The description is contradicting with the actual 
code; qemu_net_queue_send_iov appends the packet to the queue whenever 
it cannot send one immediately.

Jason Wang, I saw you are in the MAINTAINERS for net/. Can you tell if 
calling qemu_send_packet_async is allowed after it returns 0?

Regards,
Akihiko Odaki

