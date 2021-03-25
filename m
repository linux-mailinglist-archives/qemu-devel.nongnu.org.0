Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F72A3496E8
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 17:36:26 +0100 (CET)
Received: from localhost ([::1]:42516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPSy7-0007nu-7L
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 12:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPSve-0006dd-SS
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:33:51 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:33522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPSvd-0004Fm-F4
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:33:50 -0400
Received: by mail-oi1-x230.google.com with SMTP id w70so2782943oie.0
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 09:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XXetTFrNk2JxGXRCgZBCmbff91AIRx1xehtnQ2KmgOk=;
 b=DM8wtvYPD7y15/lgSZkiOWpn7SmchywSf9k67MnnoyE5TZmAY1eSRLCPQ2Vt31ljWp
 0hxuDu2tnA5iplL8bKLfHDBGODJ5f1oOhaouVC/7HkQJuRe/Gnx/ZPKPkskQmk6Q2nPf
 tPt6P2gLKcdOvO9kgJeAF3+6k3rTeWO2Miff7x88AUtPzbVlz4mfTJnxutwrlaV5RRYg
 bwJQ9mcJ8cXh4V7mx6dxsZHxr24YDu0TTM6h4RFhKSXE3ASFWYiTgefxs2wTzpP5VXZh
 7m5VsqwYQFGkP0IK7RZzTc5MP2HN9LE33CgQ3132BCAyvSis0YK8oxjcE9azZeeaIsfr
 qqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XXetTFrNk2JxGXRCgZBCmbff91AIRx1xehtnQ2KmgOk=;
 b=dW5CWpjs+eEz2Cdht3UstUxkFG0GwxosgIyIf51rGer4MVMGq6N16O3jum/hu2qRYE
 GMLsuNVfomvkvZXT2D9qeIwuJMp0mEicOM6wKA6+9t7pps4ZJKLmCQorCBGNUkjfV9vP
 CBJkfH5kBfkcL7CjNjSjUV7o/HRLSUuV8BnTdWuqlRcO9miupe4HJI8PPTom8pQHk1jU
 YahXDwPa0+I2xD7jwr4HOB9IqkXOkyZZV/IoDT+DYg/S1yiUVNg4qzZ5sAbtFpYl8drL
 56s79KhQc0xIngu3I2LGCU3sgu/RKTjTWeDj7PiVBOt7j8wC5qon4Ln1sGFdZu/C5+P6
 E1Xw==
X-Gm-Message-State: AOAM531hUUcyXUl+x5m8kX6TsVCPXjvpenX/JKtdiSLfJrYHIdPAoycc
 Hr1GEYE3UIFThPrGH74ggbOdvA==
X-Google-Smtp-Source: ABdhPJxpGubSwHdUpR7LRboiyIjqdmVWhRJEkBS7kQUBclzlhDmFMGgDDdBcdV1lt8mjVkoHaZsX8w==
X-Received: by 2002:aca:1305:: with SMTP id e5mr6387718oii.39.1616690028054;
 Thu, 25 Mar 2021 09:33:48 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id l26sm1442161otd.21.2021.03.25.09.33.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 09:33:47 -0700 (PDT)
Subject: Re: [PATCH 11/15] Hexagon (target/hexagon) circular addressing
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
 <1616640610-17319-12-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c06f50bb-cf79-f719-4cb2-4b57a0df59d6@linaro.org>
Date: Thu, 25 Mar 2021 10:33:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1616640610-17319-12-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 8:50 PM, Taylor Simpson wrote:
> +/*
> + * Many instructions will work with just macro redefinitions
> + * with the caveat that they need a tmp variable to carry a
> + * value between them.
> + */
> +#define fGEN_TCG_tmp(SHORTCODE) \
> +    do { \
> +        TCGv tmp = tcg_temp_new(); \
> +        SHORTCODE; \
> +        tcg_temp_free(tmp); \
> +    } while (0)

Wow, this is awfully magical.  I don't even see "tmp" referenced in the 
SHORTCODE.  What's going on here?


r~

