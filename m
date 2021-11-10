Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC84A44C057
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 12:51:09 +0100 (CET)
Received: from localhost ([::1]:55478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkm8C-0000UO-JA
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 06:51:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkm6Y-0008Br-KI
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 06:49:26 -0500
Received: from [2a00:1450:4864:20::42d] (port=36411
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkm6T-0001H6-Hs
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 06:49:26 -0500
Received: by mail-wr1-x42d.google.com with SMTP id s13so3537052wrb.3
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 03:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=qL5j08z9P7HYndli09vF2C3nU3zHApdwNfets98Tx+M=;
 b=whiC4JHj5JTBPb/tuYkMIDW1P9XZUivhOOqgQ4UtBsyfi8DgNfim83uK5ZMjoqzdfa
 VPocjOWmWxOZJiVaSLCiesvK8aFpQnBO2LEibiM1r/2PsZZf/q8z0zeDhJUhmvxu8jUZ
 of5gCRqSEZVcBPlzxcUoa7Zvs3jfH5KS0WCkZZZcUzvHwMNeY2xKlAi7dDpDXrWLnB57
 mV3a1Z4uGDV6YCstsYarLTv6KpG0Rnpit67MphQWKnSjTqL9A4PS82VUMV2WihODEJM0
 2cBvjU6KeONPXXmfxMiFlH1g4wBJYFr/f/nfCtZY0XGP7uP3DUYaI4qIkjZUhiY0E4AJ
 ZPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qL5j08z9P7HYndli09vF2C3nU3zHApdwNfets98Tx+M=;
 b=kyWVGVv4tgn2et0noAaMMYViebuimWZ9bgju6NijR+p9eEKbU6rhUx6EDB6AsXd+sn
 zuKTJZL+T2xwzbTPqbqUmZGlppdSXCDX9gShpbTUDSGJdS3drdELeItliUAa5Jx4xLM2
 tMHJO0VhKi9TiFmGQLWkDjg8diHEeusTgEbhWGij2SevPP1yMzJUB1NLv/lFnOYy8Ck/
 rMyB3C9r0DtsssIhjU8d5OezWzNqVvXeMedMK7OWTeEgt7VHr1dVRpLLsklE/04ITLai
 Gmth51CgAjBUjJsSMAls5MyLaOUWi4aCrq7ficzbF9vhHZPk4C+Sz7IXpj1s+t9S7YIH
 x3JA==
X-Gm-Message-State: AOAM533sc5Lzkv5zcq5h+C+h7mBcpuUSO/Q+T0kuRFYryqEnUYq5+OJY
 QVw3bvohm/xawtbn46GUngFc5oLcluqCPk7y
X-Google-Smtp-Source: ABdhPJxW9X/o/Q6idTbSKgujqlHAJcZIz/+aCdZvcVaqWdic2rBKby1zI5ybmrf2PGRGEbJv760SOA==
X-Received: by 2002:a5d:58fb:: with SMTP id f27mr19155793wrd.10.1636544960071; 
 Wed, 10 Nov 2021 03:49:20 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id d11sm22222693wrs.38.2021.11.10.03.49.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 03:49:19 -0800 (PST)
Subject: Re: [PULL 0/3] QAPI patches patches for 2021-11-10
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20211110061902.2483109-1-armbru@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bd1b612b-c4cf-c08f-9ddd-524bc7f14d7f@linaro.org>
Date: Wed, 10 Nov 2021 12:49:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211110061902.2483109-1-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 11/10/21 7:18 AM, Markus Armbruster wrote:
> The following changes since commit 0a70bcf18caf7a61d480f8448723c15209d128ef:
> 
>    Update version for v6.2.0-rc0 release (2021-11-09 18:22:57 +0100)
> 
> are available in the Git repository at:
> 
>    git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-11-10
> 
> for you to fetch changes up to 8c0bae5a19478db93371570b57164c63392a2d50:
> 
>    qapi: Belatedly mark unstable QMP parts with feature 'unstable' (2021-11-10 06:10:11 +0100)
> 
> ----------------------------------------------------------------
> QAPI patches patches for 2021-11-10
> 
> ----------------------------------------------------------------
> Markus Armbruster (3):
>        docs/devel/qapi-code-gen: Drop a duplicate paragraph
>        docs/devel/qapi-code-gen: Belatedly document feature documentation
>        qapi: Belatedly mark unstable QMP parts with feature 'unstable'
> 
>   docs/devel/qapi-code-gen.rst | 29 ++++++++++++------------
>   qapi/machine.json            | 54 ++++++++++++++++++++++++++++++++++++--------
>   2 files changed, 60 insertions(+), 23 deletions(-)

Applied, thanks.

r~


