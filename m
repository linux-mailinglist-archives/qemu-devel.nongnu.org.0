Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B98B4C2DB7
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 14:59:53 +0100 (CET)
Received: from localhost ([::1]:51226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNEet-00015d-QJ
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 08:59:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nNEcM-00080G-FW
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 08:57:26 -0500
Received: from [2607:f8b0:4864:20::434] (port=44554
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nNEcI-0004qd-0S
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 08:57:14 -0500
Received: by mail-pf1-x434.google.com with SMTP id w2so1910929pfu.11
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 05:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=vHNv0sM6EvtHVXte3IdinNcjIFVEcH1GK+QEEZrx9dI=;
 b=b6wRiXNsPBdnC/2GeUuTjNckCnuGTpgG59AWqNLVQZJUVe7O/Qyf1i3ftnylvBUqYF
 T3x7Y2706m8bdY/P3TnnFvke20YUvfHeumDE5lXpkFihUNnhPMpiOj7Xek0R3UOsFEE0
 cKbwfs5Z3cXkp02qj4Tk+Y7B7GArXGDrUByIuSILiSzP6ZdhbMh8EBWwCreD//s1dmli
 GXmwu7cO/A+IvA9depdUh68iTu3SHPq1D0PODAoATcEm8DOfWNVh41SxXKvvSOZzD7L5
 HtdqVnHGkyO5s3yoRf2AbwtU4aoI5T3tIjhBStkQ1vHTGUUJ1F6u6wDfRR0eWzeRetKX
 ft0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vHNv0sM6EvtHVXte3IdinNcjIFVEcH1GK+QEEZrx9dI=;
 b=qrW4BK3vSPKdum0Aq2457Oh+tv8faL6Gq2s1mU0cVKrUwYFmPYVc8Z1HCZGcgSr1y8
 78mgwoCVfExHFaNT180tkxU7ajP6E57LWT28TifOAA+qqAGbFLPQEEOu0saGHjcqy/o5
 /REE1sxE4fzyPv20pRq5sWHGrCVPqyqrAz3EhpUUFFR+8NgwKyLnIzxFP62DH4AskBMU
 nuoJx1Rv0lZp+duzYXdV4Mb3APm9cS0o3QOnE+AnS6PT5DkmGFDLcH9/Jw1tYjuuYlXL
 wDFB4FJlH3G1ljfq1DSVTojTmGa3FAmVJzkPWvU3YzPkV42L5dXlL4xKK0mGdm+9fyey
 56+Q==
X-Gm-Message-State: AOAM532UMcevVcaXcE+loISXCismju0PQDJbGeeM4doqcNvgRS+5k+wG
 Vc/aGdyuk4VIFsMoqCAsQoU=
X-Google-Smtp-Source: ABdhPJwmKtVomGjQIZuFg66O95UT3/K/+tjNhHGhbtR1qzYrdj3yB7UZB0RXtNNWvQEpoaOI/OBECw==
X-Received: by 2002:a63:4005:0:b0:373:9ac7:fec1 with SMTP id
 n5-20020a634005000000b003739ac7fec1mr2354723pga.12.1645711028139; 
 Thu, 24 Feb 2022 05:57:08 -0800 (PST)
Received: from [192.168.223.175] (140.red-193-152-126.dynamicip.rima-tde.net.
 [193.152.126.140])
 by smtp.gmail.com with ESMTPSA id s2sm3891143pfk.3.2022.02.24.05.57.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 05:57:07 -0800 (PST)
Message-ID: <1eccf72e-cb44-4aa2-c024-eb9af6ab74d9@gmail.com>
Date: Thu, 24 Feb 2022 14:57:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 01/12] mos6522: add defines for IFR bit flags
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, laurent@vivier.eu,
 qemu-devel@nongnu.org
References: <20220224115956.29997-1-mark.cave-ayland@ilande.co.uk>
 <20220224115956.29997-2-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220224115956.29997-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x434.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/2/22 12:59, Mark Cave-Ayland wrote:
> These are intended to make it easier to see how the physical control lines
> are wired for each instance.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   include/hw/misc/mos6522.h | 22 +++++++++++++++-------
>   1 file changed, 15 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

