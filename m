Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0F149B265
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 11:55:50 +0100 (CET)
Received: from localhost ([::1]:37424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCJUM-0002N6-0k
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 05:55:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nCJKI-0001IE-Az
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:45:26 -0500
Received: from [2a00:1450:4864:20::32c] (port=44652
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nCJKD-00086H-OI
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:45:25 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so1476260wms.3
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 02:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fptErsoROxDn7mJgyzZc7Tq95RnfMktd2P5GKeI79jo=;
 b=KzVBuvHKHp4BTAyRWtxPKWfTMjC1VC3lMBmwuO3ZitUNxiUE1wDYN4SEwIqM/drCt4
 +4XxamXeCtntX3xMpYwIRzb/meKm8cflZQcOJxYjS5GfJy/2Jb0UQNjXFBbBQ+AGsJBJ
 5dCGE8icJyZFMSkliaTMdOG5Y1vgWURbSy30FdkW7dqwWraJa6UjdYS86++kpFqjjSeT
 sW200RHdi0m/xzMPiqwUg26VZlZnfN36+6ei/aLNrO9ttO5NG7zl9/SvwxpPNchMur6u
 6NT+ovIum2TLYA2XHQXMZYmVOJfh5VWfK5fteXxKO/QtPJa4x7kOJeZhojQatsEKkfwc
 uXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fptErsoROxDn7mJgyzZc7Tq95RnfMktd2P5GKeI79jo=;
 b=3aIVrH/hB1RZDS0oWbdpPbdY5yv7Sqo44SQOlYpTcQovZu16/gSfepOC2D3vKzUSNy
 l18vUdzib5JgTMY3G6otd1BRcI9o310cR7AuBSrt8+8+BlWqq7vRRkCjUR2Etxude/eO
 NYdYp0RaF1+Je40ZL25Q3Q5NqIgV1blcAlx4RJWmzkyp5ZM91dtyDT028WFgsvx3bWY0
 HGkWMAJrNUirZQ2bsad+jDs6rYVva1G8oeGZJzZwYxc/4Vkel0aDj1gDI5fZZXRsYBhX
 bSPxvTbrCT5ck2xjtGDwkj3syq+tpff7hlB+yqzGNYh//hCw6zJrGNx18XWyCOmuM9Gv
 +4Qw==
X-Gm-Message-State: AOAM530TFybyZDUJG7okeBnWNF/J4Wn7hvU/EhEnCqdlHWcux/vB4Err
 dxWUxEcsB7lEVmJ/wNBqQq0=
X-Google-Smtp-Source: ABdhPJyjAXyvzoTlx6CPSGwUjYoOpjAh5D4fyEFsHyK4V3LWJ1RoNXDyD5lCAbOoC+AghSPL2sMapg==
X-Received: by 2002:a05:600c:204b:: with SMTP id
 p11mr2370204wmg.47.1643107514197; 
 Tue, 25 Jan 2022 02:45:14 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id z5sm302106wmp.10.2022.01.25.02.45.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 02:45:13 -0800 (PST)
Message-ID: <b3d70518-256d-2bd0-5979-ff96a1154fd1@amsat.org>
Date: Tue, 25 Jan 2022 11:45:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: "Startup" meeting (was Re: Meeting today?)
Content-Language: en-US
To: quintela@redhat.com, Mark Burton <mark.burton@greensocs.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Damien Hedde <damien.hedde@greensocs.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <YbeWxAn6Zw7rH+5K@redhat.com>
 <CC132B60-3F08-4F03-B328-4C33407BB944@greensocs.com>
 <87lf0nto1k.fsf@dusky.pond.sub.org> <YbiS8Zc7fcoeoSyC@redhat.com>
 <87bl1jqm1a.fsf@dusky.pond.sub.org>
 <CAJy5ezofpy09ZOtVHFofGTzt3U8MEA_ddpBHifuF50sVDFXULA@mail.gmail.com>
 <73955990-9FD1-42CD-B476-F2AD95C219E9@greensocs.com>
 <YdbRShE01esANc5h@redhat.com>
 <fb519eb4-c0c6-a0b6-585d-e708b04ed207@amsat.org>
 <BC0208B2-5ECE-4F74-9DFF-FB8959642C48@greensocs.com>
 <YeWjtxEcbb6jcbi8@redhat.com>
 <D36E42AD-05A6-4139-8647-07C9CEF3D659@greensocs.com>
 <87h79sw64t.fsf@secure.mitica>
In-Reply-To: <87h79sw64t.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/25/22 09:50, Juan Quintela wrote:
> Mark Burton <mark.burton@greensocs.com> wrote:
>> All, I believe we will have a followup meeting this coming Tuesday
>> 25th January, at 15:00 (presumably using the same link:
>> https://redhat.bluejeans.com/5402697718).
>>
>> We (GreenSocs/Xilinx) would like to quickly show what now ‘works’, and to give an update on the patches.
> 
> I send the call for agenda already.
> 
> We are having the meeting.

Do we need to stick to bluejeans, or can we switch to something more
generic to easily record the call, and be able to start when Juan is
not available?

