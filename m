Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE62498200
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 15:24:09 +0100 (CET)
Received: from localhost ([::1]:48798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC0GO-0007zR-VS
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 09:24:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nC0Dn-0005T9-RO
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 09:21:28 -0500
Received: from [2a00:1450:4864:20::634] (port=39875
 helo=mail-ej1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nC0Dl-0005Y6-4w
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 09:21:26 -0500
Received: by mail-ej1-x634.google.com with SMTP id j2so21649804ejk.6
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 06:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F+t2TYcD5AoIKMiWAmSkU8Jw2PIemhMfu2XgHCYYfsY=;
 b=dEpr56BnlS18FgOpG7pd4ua+qedmBPO9Emn5TXNryxuc2s4W2DYmF0Juq16XSaXOJ3
 94z3TVDbQ7Ok8sSDLjdu8i7J3rBeQDTWhvXRLRLl5xHJ+P0ycfXYQya/8vP0WWd83v50
 h0Hn3tycUsFgCOFJqkFrzWZYJjz6nrDz1UI2XDr0tWf40wEBS4e41k7lU8fwF4zimiBu
 R0psjVlZSZnbUstoq9veel/nMrqPWjYkJ6CR/uper2OqvE3L2klVw7Bq92ZEcSXnxpo/
 rmT8PCAuqPdk7gSDqqMkc071YH0SLgFCaOhWoJ3UoBSadbI3joaA9OMWpEc8lxrlSCCW
 Rw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F+t2TYcD5AoIKMiWAmSkU8Jw2PIemhMfu2XgHCYYfsY=;
 b=K+MHIFT6rJdNcOWmzzJ3DHb8GvAknp1AF3vF1SWomsd/UKxzBMeCucArr5phMWuT84
 lYt1jE0fm9bSshl5c0KkNlInlxrQohXVU9lWUN0AtuEBIQHOoHGbJAJHuvSSBXjfkzcp
 aimJ/sotO0Q7o5uYShiHBeT/IuWntraxdcm7vKVE47CFkeFvd/dKpbdiJ14Q8oBTHpOt
 i649rdw4OgpzQR7RTRorNskaxhXGpFPhRp1iNkXnKIZUWaZnbNvvtExORWiqCi/C0nkW
 fXKldqfdPelR6hfJRY0lb5ZGDE6N3T+Ihd9NAymnXvZDn8lT81EwrKw/jGGqLrlGNdAM
 9dPg==
X-Gm-Message-State: AOAM5337QqaJlm6pMaCw1uSSj0Q08YCCXfhgVym5/fQTH4jV4g3yS/+s
 Ia0amqRUFTHq6oqKHXHwmVw=
X-Google-Smtp-Source: ABdhPJxaJqj4Jxocs0xKJWVfCZqDPqLLKVoYy0jAfXF/VMqlIvZYQE7P4EF3RfQunqjnLOeODyy+ug==
X-Received: by 2002:a17:907:6ea1:: with SMTP id
 sh33mr13044845ejc.738.1643034078460; 
 Mon, 24 Jan 2022 06:21:18 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id lc22sm4930747ejc.76.2022.01.24.06.21.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 06:21:18 -0800 (PST)
Message-ID: <5f0d0095-979f-f222-0e6b-673082bdac82@redhat.com>
Date: Mon, 24 Jan 2022 15:21:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] configure: fix parameter expansion of --cross-cc-cflags
 options
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org
References: <20220120173142.2755077-1-matheus.ferst@eldorado.org.br>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220120173142.2755077-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::634
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
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
Cc: thuth@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/22 18:31, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Without this fix, any use of --cross-cc-cflags-* causes a message like:
> $ ../configure --cross-cc-ppc64le=clang --cross-cc-cflags-ppc64le="-target powerpc64le-unknown-linux-gnu -sysroot ..."
> ../configure: 1: eval: cross_cc_cflags_--cross-cc-cflags-ppc64le=-target: not found
> ../configure: 3816: export: cross_cc_cflags_--cross-cc-cflags-ppc64le: bad variable name
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   configure | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index e1a31fb332..4735c1bffc 100755
> --- a/configure
> +++ b/configure
> @@ -402,7 +402,7 @@ for opt do
>     ;;
>     --cross-cc-*[!a-zA-Z0-9_-]*=*) error_exit "Passed bad --cross-cc-FOO option"
>     ;;
> -  --cross-cc-cflags-*) cc_arch=${opt#--cross-cc-flags-}; cc_arch=${cc_arch%%=*}
> +  --cross-cc-cflags-*) cc_arch=${opt#--cross-cc-cflags-}; cc_arch=${cc_arch%%=*}
>                         eval "cross_cc_cflags_${cc_arch}=\$optarg"
>                         cross_cc_vars="$cross_cc_vars cross_cc_cflags_${cc_arch}"
>     ;;

Queued, thanks.

Paolo

