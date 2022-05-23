Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EF353157A
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 20:23:13 +0200 (CEST)
Received: from localhost ([::1]:54644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntCi0-0002DM-PC
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 14:23:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntCgi-0000yY-7d
 for qemu-devel@nongnu.org; Mon, 23 May 2022 14:21:52 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:37518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntCgg-0007Hk-LL
 for qemu-devel@nongnu.org; Mon, 23 May 2022 14:21:51 -0400
Received: by mail-pg1-x52b.google.com with SMTP id d38so357599pgm.4
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 11:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vgBTIqg/3P+gUsLc7USNKwsi7I47nRrZ4RwPqc2V2DY=;
 b=Zsavyj/1AUXVIeMOPDPNNwtF7ypxtkon0FaLVQ2e8DsIc3q9isxnMplbOAgARPPSr9
 BNrh88HlFUbDZLX5e66V08LPg37IgrenORtaRCRS5w6zmaYulJkB+Vz6itqxzMiTBEQv
 3xMRNLF6UD1ZeiO53sE55V/ZEDRb6KA0cQvjguZYlSmk2JHN6BcPacJc/A/kIVaAVFpT
 re3++LT9ZCB/A3jLeJ8EIM7H1UR825zZyiPgo/L3/eOGzfxlkl/0cpJUlQKufe6jnX6Z
 ib3NADatzvSx+lnqj+W0GMJYueycXPoWV6qBGP2PpyyS/Hpn5cvY3ptZGfCiU8rj3Cn5
 Xs+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vgBTIqg/3P+gUsLc7USNKwsi7I47nRrZ4RwPqc2V2DY=;
 b=v0/E4tjMp9vinq37ZXIAKJ3m9fYv63a5Q7kfl9nb4+w9EWm97JfGmkJwCCA3UI4XoT
 CGKKGIPLTUoC4zXSNkeYbu8Z1/dBvhxz7I1I7qcXaM93xLEjZJ4VrtY9+4xJ5feC8AM+
 Kok5ktbxft/6EzsUo4ax3Kk1LEiaxva2ishq82Z/IMOcx7NpQE7xsooyFtCT8C0WY/UY
 ENkEhCujAboODj6+hZmPGpscOBWIJXHOzMQ7/Qi64w4dGrDcXXmyrCmTdrIgUT2g38jx
 x2VQeI6IXEWf/s7j7L27EIbmACpwU/SwNgfyOQgV7Wgl7LwCrHXax+SMh54Cx9xSfFnZ
 0GxQ==
X-Gm-Message-State: AOAM533NzHobjmsjhWLisyE/YICNNpZaUeIIUew4BegbzO0vgWNpv3AL
 yGFI4df/LZKKz1nqHY22aSYGWg==
X-Google-Smtp-Source: ABdhPJyDDBY8jh7LTf/w956de+VrBreBnZppIOYman+Q8XsvK9Ri6+PFMT7RjK2YTLV3RlGTMKVH7w==
X-Received: by 2002:a05:6a00:894:b0:518:7f19:f21d with SMTP id
 q20-20020a056a00089400b005187f19f21dmr13267642pfj.4.1653330109108; 
 Mon, 23 May 2022 11:21:49 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a170902eacc00b0015e8d4eb288sm5444039pld.210.2022.05.23.11.21.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 11:21:48 -0700 (PDT)
Message-ID: <de7a2cbd-8025-6401-e7c1-1036bb79e37a@linaro.org>
Date: Mon, 23 May 2022 11:21:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 23/49] semihosting: Split out semihost_sys_open
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-24-richard.henderson@linaro.org>
 <CAFEAcA8ENQo8258jw=CeBG6Qamk49_zQ9RQjuwd4ZfymD=cV-w@mail.gmail.com>
 <520b25a5-1270-6ccd-cf88-281a077cecb2@linaro.org>
 <CAFEAcA-4HToZFUaH4LpptA10hEOLK-ZJbHivgCxDfTiFm_CDoQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-4HToZFUaH4LpptA10hEOLK-ZJbHivgCxDfTiFm_CDoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/23/22 09:54, Peter Maydell wrote:
> On Mon, 23 May 2022 at 16:46, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> Also, I think I mentioned this in the v2 cover but not here, that having done the errno
>> conversion here for arm semihosting, it worked less well for mips and xtensa, which have a
>> rather better defined set of errnos.
>>
>> My question from v2 was: should we in fact convert back from gdb's errno to host errno in
>> gdbstub.c handle_file_io(), and then let each semihosting backend convert from host to guest?
> 
> That sounds like it's probably a better idea (though I'm not sure
> what host errno we use for the gdb "unknown errno" case)...

An excellent question.  I note that both mips and xtensa use EINVAL when there is no exact 
match for the guest.  It does seem to be the least bad option.


r~

