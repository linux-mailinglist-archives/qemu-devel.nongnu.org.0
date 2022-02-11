Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BD74B1DEB
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 06:31:43 +0100 (CET)
Received: from localhost ([::1]:32784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIOX0-0007J5-UI
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 00:31:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIOUl-00046o-TR
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 00:29:25 -0500
Received: from [2607:f8b0:4864:20::42a] (port=43791
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIOUi-0007ab-MR
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 00:29:22 -0500
Received: by mail-pf1-x42a.google.com with SMTP id d187so14285046pfa.10
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 21:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=G+zuUw281w0mZTuVUKw4SiDYQJ8Dv09+ek8gyucXX5w=;
 b=lRJ6fEcSBOp9FS6jg0JUdJb30FsHIHaBq7V0r5kGDzBxydYtq0r6ayGdewl5AOo+N4
 9xvHpJDxNPT0gAF/cdSLy9XlZDl87roj6njGzBAe2R8iPFaxehzMJDG4ct4rhEppzxwi
 K10RsvBtAA4VgtqhswhB6Ut0RMJJHoUqxiVF0U02TcKUffCBolgyxirSoXC24bHMkbbc
 ttSZ20oxOcORZxxF4U+bZbveJh2d9bE7J0Nv1NnCzS1W9FXK3sOLNT+Js6WQR92DSLEl
 O/Co5jcguxpPHRsCBDbtocQpBSac6zmCxLQilP15jjOQjOdSkrXxWWrZjs94C9ntbdJ4
 MHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G+zuUw281w0mZTuVUKw4SiDYQJ8Dv09+ek8gyucXX5w=;
 b=goxJoxX3WqqW0ud8suN9Cectm+AsYcLG6o5DUzwUK+0JhLCUsImbfiBosiGUZvvk/Z
 iENk8ujqo91yo/jt64xgWMzG6xyNeX2+/01NZt8yrtAJuKrJBCzW1stC2bsEmCerx4xQ
 nWgtxXyXGDET4jYaZrWi2HpOigYkKXP5gOp6Cp5mM4jPoZ41j5phQmI6Mm/z2/YNd+qC
 Kv0LfM5vDGZp5yDxyosIIzhDFCB6FWwfN1UkvNocSuLr0u6/5tNdQLtxLecQ+7oQVvs7
 0AC/znxpWMuLI7CJNnJ6u2b5ntUr3xcht+erU1PHlcCIkcHcz4MgOLIAZHPE/woZy4bj
 9jLQ==
X-Gm-Message-State: AOAM531yBCCWLCR95eOZ+YGVUL6f0xy2E3z0ZJlRVx/1PST7Wz4EZ/c9
 en2D/4mTBGR0i7t0fhYaEiItXg==
X-Google-Smtp-Source: ABdhPJzlJwpGj+sZpXO5j6KSiSHP2XMyJvEBc/RRL8MDvj1UYslXYcnyiGRdDcaP7lg6JuoRlSCU0Q==
X-Received: by 2002:aa7:828c:: with SMTP id s12mr60134pfm.6.1644557359223;
 Thu, 10 Feb 2022 21:29:19 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id z9sm1356384pgz.32.2022.02.10.21.29.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 21:29:18 -0800 (PST)
Message-ID: <40b2f325-1fd3-ae19-52fe-60c027f1b0cf@linaro.org>
Date: Fri, 11 Feb 2022 15:53:19 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 12/37] target/ppc: Implement Vector Compare Greater
 Than Quadword
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220210123447.3933301-1-matheus.ferst@eldorado.org.br>
 <20220210123447.3933301-13-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220210123447.3933301-13-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 23:34, matheus.ferst@eldorado.org.br wrote:
> +    get_avr64(t0, a->vra, true);
> +    get_avr64(t1, a->vrb, true);
> +    tcg_gen_brcond_i64(sign ? TCG_COND_GT : TCG_COND_GTU, t0, t1, l1);
> +    tcg_gen_brcond_i64(sign ? TCG_COND_LT : TCG_COND_LTU, t0, t1, l2);
> +
> +    get_avr64(t0, a->vra, false);
> +    get_avr64(t1, a->vrb, false);
> +    tcg_gen_brcond_i64(TCG_COND_GTU, t0, t1, l1);
> +    tcg_gen_br(l2);

Similarly wrt branches, and computation of the result.


r~

