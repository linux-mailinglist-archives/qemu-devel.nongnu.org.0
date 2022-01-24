Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E120849886C
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 19:34:37 +0100 (CET)
Received: from localhost ([::1]:46514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC4Am-0003PU-VI
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 13:34:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC3v5-0005YU-Mn
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 13:18:23 -0500
Received: from [2a00:1450:4864:20::331] (port=56025
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC3v3-0000Rj-Tp
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 13:18:23 -0500
Received: by mail-wm1-x331.google.com with SMTP id c66so23495239wma.5
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 10:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A+1TOmyS5yfQmck03Oc35rRfRKnhdmGczYlan+uH6m4=;
 b=mO4HK1mODG4rPBbmQsDrOUkJ+7xt2mpv33PlBWBCx8dYvxoN8o1KjD/SBl18HlIwq7
 tS22gSZgZE6sb0tQrTj0nb1eO2o4NMUPMhUyL+Rmx/enklg4EV2auU2fgtlcdOCPoAwy
 YPh2IgiB4EnKO5kVQV1mfJCtt0+hprOP1CknEm77egHg3HCj2rCVb5TnjVj/ZWBAUmaA
 YVrn7BawhHJt/7HMWkeCmiSTDzskLZoQqru3tHeLu8lcYKYGuXEN2YqlNieVp/X+TGec
 wEU+wxWVd+sAA5bFJpHFSQfq6M0Uj6O//rb3NKVhuwt+fJp8bucX5G0XLbie5FNJQlzJ
 JS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A+1TOmyS5yfQmck03Oc35rRfRKnhdmGczYlan+uH6m4=;
 b=a5hcYqGNsj3xEB17nEav+KJgUQZzklF4ks4I3jxdj1rG/U2L+F37gspk9dtZnlKQvr
 249xtwTKw0qNoNmMe5nph1v6GfccnvDmW2HF3Zjk0dijAw0chD7/2mOtgDklcrOKDLcF
 7JFNaNjkPIn3LGBB79DgAY34oT8LvJjvx3Z1txKrUNNYElpHF+bpfrSUyvnIqx9Gz3EB
 0tYQRUTTLZzpoGF4KTRrEifxUL8BKSwmL4E+zQSOJZ9wzp+FE/i0+e7r1FtXZyFm8RGP
 bmzB3tEZ8T+WvTlXgCChVfgLFBrDBYOSpuDYwGBYgRcz0lwzj0JRotMuoGpsfoUUbc2H
 e8Lw==
X-Gm-Message-State: AOAM533b+hUYmRpXQWXkYa+VSuW4soIdHKnpgXxkfTffnRecSJ8TBzOp
 0Xq5iwShicfFt6u4nfw5+q0=
X-Google-Smtp-Source: ABdhPJzCxR0VTlO6vtXcyQDwfjlqWU1O2hJtbqkOLThwt2Q0Qo+1cvNbhSywIfMQQIrYxU/wscxBmQ==
X-Received: by 2002:a7b:c00d:: with SMTP id c13mr2873611wmb.99.1643048291066; 
 Mon, 24 Jan 2022 10:18:11 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id f13sm14519787wrp.105.2022.01.24.10.18.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 10:18:10 -0800 (PST)
Message-ID: <8867abae-b03e-d32c-7ace-ba74206d8d52@amsat.org>
Date: Mon, 24 Jan 2022 19:18:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] configure: fix parameter expansion of
 --cross-cc-cflags options
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, thuth@redhat.com, richard.henderson@linaro.org,
 alex.bennee@linaro.org
References: <20220124172314.2974833-1-matheus.ferst@eldorado.org.br>
In-Reply-To: <20220124172314.2974833-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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

On 1/24/22 18:23, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Without this fix, any use of --cross-cc-cflags-* causes a message like:
> $ ../configure --cross-cc-ppc64le=clang --cross-cc-cflags-ppc64le="-target powerpc64le-unknown-linux-gnu -sysroot ..."
> ../configure: 1: eval: cross_cc_cflags_--cross-cc-cflags-ppc64le=-target: not found
> ../configure: 3816: export: cross_cc_cflags_--cross-cc-cflags-ppc64le: bad variable name
> 
> Also, update the documentation to reflect the option being parsed by
> configure.
> 
> Fixes: d422b2bc23 ("configure: allow user to specify --cross-cc-cflags-foo=")
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>  configure              | 4 ++--
>  docs/devel/testing.rst | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

