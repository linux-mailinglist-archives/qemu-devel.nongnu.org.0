Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B24844BD9DC
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 14:14:53 +0100 (CET)
Received: from localhost ([::1]:58810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM8Wi-0002WP-R7
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 08:14:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nM7XE-0003zX-9z; Mon, 21 Feb 2022 07:11:21 -0500
Received: from [2607:f8b0:4864:20::52e] (port=46885
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nM7XC-0003Ax-6s; Mon, 21 Feb 2022 07:11:20 -0500
Received: by mail-pg1-x52e.google.com with SMTP id s16so14098066pgs.13;
 Mon, 21 Feb 2022 04:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=cUS96mvudsomXhwNWgC3EYduV0VZ7Kwwkf0TT8NGYWQ=;
 b=Pl3+slEELiOcIA2Mi5/CvlJTNa0YDhEFgBfbfo4n4SNdGFXB7jjl0w0fogjEMz0odU
 jxrUoySGUv84dBrZHzrbtnEufxYybTtYc4UKFEd/tsz8KFtn+iXTrpbATzNdtGtMZA4U
 bkj+KUqNmnQF+/MTeY79nrtDSqFhczeXSweeJEcyk1yUUPUetZ6ML+H4hwWoa7stJUFE
 8YQOd05C/Lqi5186rhEdwt/tJWkxEsBGO4FPliP3xI800XLnfMVN/Z822NwMokkGRhQU
 56fPma+w1rqQCzd/GS6p4e97sVXOVPq0r2c4Wfzx85VjdXPeY6wX0oO6OuxMqOhDifVM
 GA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cUS96mvudsomXhwNWgC3EYduV0VZ7Kwwkf0TT8NGYWQ=;
 b=36oVFUxvoG3CNAftbeJoE0OX65/7CQ6eGhTk9m5NPF+kKXnkP1F12+LtX5ObRrBcE7
 9KuhUPDB/tpGXTltMJyl06nQc8c7/1HBE4FD6P3xONSyaMSNEADN/pbSq+OTBSil+XnZ
 fBPrVHb/xuDDeUbcSdIe9TEOxznJIWiprJS4I+Uc+BX5eKKvXpuzQjarFqGGpBc5FqRv
 13ka93jlOEalMjqeGAr3CMbKpP9chIGz+M0WBpSteJAWSWiQEeeE+mJ+2Zqmy2SLs3NZ
 oWYgu9kUm2kiGShQ3GYlTn9stgkBopW+NRN7ZMAT44J2oyagLbW2cswwzDG1g0kjQ/0W
 vkfA==
X-Gm-Message-State: AOAM531ReZ+tKsE2LfJ78rER+WhDg74u3chfcV2Gok6CczTxBg/LoR63
 QcOPd2M3OF50CH1XBkPMujQ=
X-Google-Smtp-Source: ABdhPJwapFy/RZIvQKFqx5vnD9mFLd5+72T3U2NuCRa3UQNWrRQXbT8UkQOG1eDljbmJ8pW5sgtqeg==
X-Received: by 2002:a05:6a00:21c7:b0:4e1:dba1:a3a6 with SMTP id
 t7-20020a056a0021c700b004e1dba1a3a6mr17935078pfj.59.1645445476477; 
 Mon, 21 Feb 2022 04:11:16 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id h14sm14425338pfh.95.2022.02.21.04.11.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 04:11:16 -0800 (PST)
Message-ID: <98a71807-d91f-09b1-0584-42c02afa9db0@gmail.com>
Date: Mon, 21 Feb 2022 13:11:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH] tests/avocado/machine_s390_ccw_virtio: Adapt test to new
 default resolution
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220221101933.307525-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220221101933.307525-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52e.google.com
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
Cc: Eric Farman <farman@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/2/22 11:19, Thomas Huth wrote:
> QEMU's default screen resolution recently changed to 1280x800, so the
> resolution in the screen shot header changed of course, too.
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Fixes: de72c4b7cd ("edid: set default resolution to 1280x800 (WXGA)")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/avocado/machine_s390_ccw_virtio.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


