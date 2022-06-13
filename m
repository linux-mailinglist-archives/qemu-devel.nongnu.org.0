Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7ED549E33
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 21:57:24 +0200 (CEST)
Received: from localhost ([::1]:50230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0qBf-0003zp-0V
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 15:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0q8q-00011W-AM
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 15:54:28 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:41846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0q8o-0005Zq-Rl
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 15:54:28 -0400
Received: by mail-pl1-x629.google.com with SMTP id g8so764412plt.8
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 12:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=51/4hhk2XsCZO+LfL9dbZ0oVUb7QBx9fkWcrq5bQTwg=;
 b=GuTMYGeiDRxsa4WOfNGvLV0wIDQ7HiTFLCSIA82pqlHx/PohBU/MgBobKVhOtO6F8N
 funZYIvxR9IGdvo/NCw7P69cwcko2hLUeabnHnnXyJwpGMSNxJCK6ErRIxHd0lA8IaUs
 PftKIDYXIsBcubMJFN33XbmRsKBBQx6E+1f3dwLWB2rGruC6uI26hXUqtn4LrdE8/swb
 2DBAhqIW7JXFy1iFhZFmcXyIXXsk5LJZAH/t4x1AvrXie2QJj+RlDLGIOJrXHLRJZqL2
 91Nbl1G3BGTvQJjnhyaTw36wlOzPrrI3+bAdjtP/PVNfN62HCZY87MIrokOsRLeC4MIC
 wpgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=51/4hhk2XsCZO+LfL9dbZ0oVUb7QBx9fkWcrq5bQTwg=;
 b=H3mFqbrnDdjVHveYBX9fcS2JSvWoaiGxcTRPA8LuqxxHfwdqz2ConToAIRoVvOkSN/
 dScs28HwOFKUal8f2PpAw0CoICrp1vS1qyfmT5CszvLP20QHRFuS3CQZKlFcRuBZ6Br4
 I48nV35JEAprycLLeFNntKt/+VKoog0C7pGrguwEZKVhhw5ayeRqbkWrOnYZ9WPEanHH
 /anDLQ4ZBLOzemxqyhdahesispCIQNu6ooyrZMf/+Eav18F7nEamyNqptI3F3vnR4Fop
 mJdsGQf3ZJgAmwOfChQT5185MwSTVRDD4WXluoVIvHdtwuZZeiBFajZ1RsMsb/2u39n4
 obNQ==
X-Gm-Message-State: AJIora94tBpQDYRBevj6ekDOA5wwhJA8ThJ5VIBM/0qClnBFIGe7TjJP
 w9fjBn06Cc5Z+l90awSfjhHMGQ==
X-Google-Smtp-Source: AGRyM1shprC7GBGdRGbuTwrdAj+bxYjHYEAGMIEw8uWAFpSKWI+tFPUHtsAw2vt8QEhwo1RcbiG2Rg==
X-Received: by 2002:a17:902:da87:b0:166:423d:f3be with SMTP id
 j7-20020a170902da8700b00166423df3bemr673383plx.150.1655150064961; 
 Mon, 13 Jun 2022 12:54:24 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a17090264c200b0016641a37e71sm5468587pli.225.2022.06.13.12.54.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 12:54:24 -0700 (PDT)
Message-ID: <2ad89301-72ec-33ea-9b7c-cf0c0f414312@linaro.org>
Date: Mon, 13 Jun 2022 12:54:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 10/11] bsd-user: Implement trunctate and ftruncate
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, def@FreeBSD.org, arrowd@freebsd.org,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>
References: <20220612204851.19914-1-imp@bsdimp.com>
 <20220612204851.19914-11-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220612204851.19914-11-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

On 6/12/22 13:48, Warner Losh wrote:
> +static abi_long do_bsd_ftruncate(void *cpu_env, abi_long arg1,
> +        abi_long arg2, abi_long arg3, abi_long arg4)
> +{
> +

Extra line.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

