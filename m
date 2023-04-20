Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1AE6E8D7D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:06:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQEk-00078u-KO; Thu, 20 Apr 2023 05:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppQEe-00076o-1z
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:05:49 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppQEc-0001yW-DL
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:05:47 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f09b9ac51dso14012535e9.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 02:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681981545; x=1684573545;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MlLktOznMVzr2tayV6GwFlSYncdX+nH211JeEEeOcLI=;
 b=p0HWbHtHKmQSJSDvwRfpGym65NMxnJbtUyarSSavreqfTVB2Q0C8NGwBFnl24CzruY
 OTGNkMPs1mb/UBjstXFQgVDa7ta+n93pV42AZeE3GUxGd65LfATJBvDnt4UWsQtMNGur
 jcOD+2Ks79tvPeLOCEad9XzrhaKfTngr/8PE78n1pmACmWHe191TEUcfg/eCOA+ufytl
 RTgsnesxta8TAyUCG2RFya57lYJsS178353e7zTPCLX/uECAN1BnPhA/etCzbPBKiMfQ
 ntSctQbD0+M/CGyRC5A3SFnMvDVJp5tkhWW3c5JZHND39CiyrfQbNE/EcLECyaCpUwtk
 QXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681981545; x=1684573545;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MlLktOznMVzr2tayV6GwFlSYncdX+nH211JeEEeOcLI=;
 b=iiEAhY9BuEeB9n6yCley233dNsa3i6C4RMHNWhpPWFxsea3VQJ+2NDpz0uwqDcfNrZ
 OsK/v/QarK9f/T+oeo+/J471FDi7XKTiQOeHongTiZADTECWH2zZZNPEghMSJZg1w89B
 nZd5zKjzyEZiSaZbnke8OIsAHjChFu+YgreRKDijBPwE2+JUcP42zL/SB2PS8AzTDvFQ
 C6ybEv+oTsU4icE09vbZXXti+mVvn66040MGLNk1ar2OmwETvv8fH8QuYMLeq/B6YikJ
 hUOVj6HxseU6dmpUO4git6tpKO7hhYT7ISfQeaxqQVGCbx2ohtbu8ud/B3lagKEjExYD
 1clg==
X-Gm-Message-State: AAQBX9ePnRStZHMZhUga7m0aWTQmRTz8jObUzZ2elECAcZLIM5A+OHXZ
 SKHdA5Wr4vVL9KBEjg4zg2JuhQ==
X-Google-Smtp-Source: AKy350aCrFNbzobAv33j4BWqBd5905+QLIkncy1+LiZnn0v0mnyRZfO/idg0bquZUcwOSSJpLqRhYQ==
X-Received: by 2002:a5d:4b45:0:b0:2f6:3930:fa7f with SMTP id
 w5-20020a5d4b45000000b002f63930fa7fmr4604099wrs.7.1681981544775; 
 Thu, 20 Apr 2023 02:05:44 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m4-20020adffa04000000b002fe96f0b3acsm1395269wrr.63.2023.04.20.02.05.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 02:05:44 -0700 (PDT)
Message-ID: <6070b1fa-f327-c663-5344-63ba577385c5@linaro.org>
Date: Thu, 20 Apr 2023 11:05:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 10/10] hmp: Deprecate 'singlestep' member of StatusInfo
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
References: <20230417164041.684562-1-peter.maydell@linaro.org>
 <20230417164041.684562-11-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230417164041.684562-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 17/4/23 18:40, Peter Maydell wrote:
> The 'singlestep' member of StatusInfo has never done what the QMP
> documentation claims it does.  What it actually reports is whether
> TCG is working in "one guest instruction per translation block" mode.
> 
> We no longer need this field for the HMP 'info status' command, as
> we've moved that information to 'info jit'.  It seems unlikely that
> anybody is monitoring the state of this obscure TCG setting via QMP,
> especially since QMP provides no means for changing the setting.  So
> simply deprecate the field, without providing any replacement.
> 
> Until we do eventually delete the member, correct the misstatements
> in the QAPI documentation about it.
> 
> If we do find that there are users for this, then the most likely way
> we would provide replacement access to the information would be to
> put the accelerator QOM object at a well-known path such as
> /machine/accel, which could then be used with the existing qom-set
> and qom-get commands.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> For v3: because we're only deprecating the existing member,
> not trying to provide a replacement with a new name, we don't
> need to update the iotests that use the command. (We will when
> we eventually drop the deprecated member.)
> ---
>   docs/about/deprecated.rst | 14 ++++++++++++++
>   qapi/run-state.json       | 14 +++++++++++---
>   2 files changed, 25 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


