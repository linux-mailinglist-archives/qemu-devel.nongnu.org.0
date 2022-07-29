Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DB8585331
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 18:09:58 +0200 (CEST)
Received: from localhost ([::1]:47800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHSYm-0005Ir-EQ
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 12:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHSQo-000752-2i
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 12:01:42 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:35754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHSQm-00026s-Gi
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 12:01:41 -0400
Received: by mail-pf1-x434.google.com with SMTP id c139so5004277pfc.2
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 09:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=f1WzOw/pQH45rNHbEUa8RTvIZ0Wdud2azc5ri0Z7i+Q=;
 b=qljBME5q9Z9TovGKemKmsRQHaHTYILgrTUdjTwGUyqPVk62UY8gzEclilgUfDUr2qW
 YMaYKYyP+vOi1Ex2sRSk8jCHANNbNVEWw2cWcDJktL8g/UXnzOOAaObc//3SYLGWHB8p
 g9LNdKazinBnWDJQUgtmPagUDtK9dik8eM6fMvIhewfHnAJUm38vdoaCNTszD72/n7El
 CccvuPMWNhQjqi3hcydjP8h8Ofg4+LVoUzRTCEkEn3AwazH/NLvIiuI9p7Pl8WlFoP5h
 7tAPBob8pfuEbT+oToeuTYqTgEzulQ9Zc1TayFXw7gMgegUnwFru9BHjrk26YUOsfRlV
 nIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f1WzOw/pQH45rNHbEUa8RTvIZ0Wdud2azc5ri0Z7i+Q=;
 b=BPJQyPeTo8SoktfHsDAZ62LyytLeR6yy4jhmjIlJksLj+S55VDTAoHAfh65oZ+7WGI
 ULmXi0v9AX4jYDQbAOnTkn9uajbNrrexdZYzvOppz6CQ6sjGxDZIkityy2SJ3K0Tw7op
 RTQ1JMgGduYHxUgyzs5czwGl2F+tBYtxj6KafqzzGubqwRiRgORMiunngGq6WBi4VRre
 GfbCuTyZGL1l6+5sDsS9fitCbvP0GcJhUMTvROD052S09welyoAtaActa+RfzNCD1Gpj
 4NhJ3VJJDa5tDiFiokbd2JnQam+vrWcAhiwHaLco6iHpgSMnEB12G/+AzzZLpRB+2Iyb
 t2rQ==
X-Gm-Message-State: AJIora+R4SOY16zm0HXLHaEH3sdZj9gQdZcfM6tnRIHaEqD0778pz2+Z
 gYkYOswavAcwerXS8eKG+C7uul2MytnViw==
X-Google-Smtp-Source: AGRyM1uxHAewJevyNWvpvZ4FUubOZ9LdUWRImPAdd6iXiR5MOi2g5zG9GvX2ESoL3qfPI0ri00L7WA==
X-Received: by 2002:a05:6a00:1992:b0:52b:183e:d829 with SMTP id
 d18-20020a056a00199200b0052b183ed829mr4522705pfl.26.1659110498576; 
 Fri, 29 Jul 2022 09:01:38 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:51c4:5cf0:5954:aeb6?
 ([2602:ae:1549:801:51c4:5cf0:5954:aeb6])
 by smtp.gmail.com with ESMTPSA id
 w16-20020aa79a10000000b0052536c695c0sm3089180pfj.170.2022.07.29.09.01.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 09:01:37 -0700 (PDT)
Message-ID: <d03974ec-4b8b-2ba2-cfe8-5c235d937b76@linaro.org>
Date: Fri, 29 Jul 2022 09:01:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] linux-user: Use memfd for open syscall emulation
Content-Language: en-US
To: =?UTF-8?Q?Rainer_M=c3=bcller?= <raimue@codingfarm.de>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
References: <20220725162811.87985-1-raimue@codingfarm.de>
 <20220729154951.76268-1-raimue@codingfarm.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220729154951.76268-1-raimue@codingfarm.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

On 7/29/22 08:49, Rainer Müller wrote:
> +            /* create temporary file to map stat to */
> +            tmpdir = getenv("TMPDIR");
> +            if (!tmpdir)
> +                tmpdir = "/tmp";
> +            snprintf(filename, sizeof(filename), "%s/qemu-open.XXXXXX", tmpdir);
> +            fd = mkstemp(filename);
> +            if (fd < 0) {
> +                return fd;
> +            }

We've been using g_file_open_tmp elsewhere; probably good to follow suit here.


r~

