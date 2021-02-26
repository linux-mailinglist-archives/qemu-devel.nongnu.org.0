Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88FD326620
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 18:09:56 +0100 (CET)
Received: from localhost ([::1]:58764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFgcl-0004cP-Me
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 12:09:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFgEz-0007Rv-Ot
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 11:45:23 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:53470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFgEp-00035c-VG
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 11:45:18 -0500
Received: by mail-wm1-x32f.google.com with SMTP id x16so7918999wmk.3
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 08:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Eto2OWhVPD8MFtzEcy1DVlxLcxqklrIjPtJqSjAU26I=;
 b=m/QQ/fP7WpCtoPfq6Pv3QvYC8AGLnKvpy5KUtoPYfFnEzf9t817J0BTJN1WVLqHpc6
 Hv9GihxE/0fxyzJ409hj8iGcVh7wssvDvX5bJPhSeAzYsYJf0LY7tJeF8uj2f/eBWNeB
 LVIMS4/ALHpE1ag1KbDb5383m4yFbui4cCCj1XThCSCWVstuBEtHB+wOQYeW6FcUmJup
 0HEUIOn8L0A56UhFeL7Po8kqP0/yU/Gtr20qdn3mJmkLE4zjEtk0/7ztfAVxBHfNBLtW
 DjC6EY27wqL3BplmKpVQ0YuMVY29sxyaEgYjQBQ943S9R2CYEQKYDmLqNne2anM0bXNF
 RfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Eto2OWhVPD8MFtzEcy1DVlxLcxqklrIjPtJqSjAU26I=;
 b=lPhNyP6v0SRyeyPebsZuWCbVkm6gCanTz1O4ohxt3uC0qlk88xveyBhVIqEYGRQggK
 1FY1uHlOcNnKXPCuHjmiH1sSIaIGPwKIY2W+jz1TYqspgPCttQuEkAk9tSPNQsez6isD
 okbH+d9sc1LBu3QVdvzzDisELkRcSYb6/wq/4ClSHRgQ2i/h7Qo0VyyOX8mXpbFJ3fMK
 OzlXM7fppBevtzDBrzZFS14dUfmljKCmdI7qy4WXhHrp7h8HMysjfvGD7W6SV86Qz4tA
 BlWFBwbRwNzouXZdGTCEwAcMTI4ztQog0aP4WbPmi+ntWBs0o9S982NRD5g5Zf/oIzpA
 OsGA==
X-Gm-Message-State: AOAM531ChgCGs8EsdgnOQC6QxXiKZ7LBEX2z+s0Ut0KFM3zwGlGYN196
 Yk/+EWOLBKMb4Xfd6cI+EMU=
X-Google-Smtp-Source: ABdhPJysjHZuLIQINWgO0IERyHKN/SaapFE8VO6koapD2ZvTAIouNnmvG4A+0Nbb8ykY1zanXQ8s4w==
X-Received: by 2002:a1c:cc04:: with SMTP id h4mr3718299wmb.142.1614357908921; 
 Fri, 26 Feb 2021 08:45:08 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j125sm12574800wmb.44.2021.02.26.08.45.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 08:45:08 -0800 (PST)
Subject: Re: [PATCH 1/2] target/i386: Rename helper_fldt, helper_fstt
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210226162022.375654-1-richard.henderson@linaro.org>
 <20210226162022.375654-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <076b4148-9ec3-2186-66e8-80be080cabd5@amsat.org>
Date: Fri, 26 Feb 2021 17:45:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210226162022.375654-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.349,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, cfontana@suse.de, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/21 5:20 PM, Richard Henderson wrote:
> Change the prefix from "helper" to "do".  The former should be
> reserved for those functions that are called from TCG; the latter
> is in use within the file already for those functions that are
> called from the helper functions, adding a "retaddr" argument.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/i386/tcg/fpu_helper.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

