Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65127415B33
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 11:42:55 +0200 (CEST)
Received: from localhost ([::1]:48994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTLFm-0000Am-Fr
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 05:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTL8n-0007w4-49
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:35:41 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTL8l-0000Yp-NL
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:35:40 -0400
Received: by mail-wr1-x42f.google.com with SMTP id t8so15457037wri.1
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 02:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Bn4gydA3+4hrSfLuKGGsunzs3vlRYmuIvxAGjTI7Uio=;
 b=qB/uYzcp4I8BKpr/brzazwP8gbQJUMrQ+WWLAVdbclCAQN3Q9sLyCjKFZZYNdfLgKC
 phegJ1SvamT50rfhiX9OXqBdUivi3rYdWzuWS4SHIVtCB+l2lLJWCmYGv/QXUAj8tC4U
 HbQre5KQUqqeq8HjQ3czAhgANfp8jtqzGepjee2VQ92lg/LURBIZ2d7M+T7ABrw891i7
 jkJwV45EPC+MSxCfHMRrxoN0iktXbYvf13bnvOPd5vhCuoVwSi11kREJKQpbfYp+BJun
 JeQ1vqCRqhonTFD0FeZV1yLfzaoaH5uZh88KelTe6xqNi3I5IFhllPCerzyA/25PpP1q
 DStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Bn4gydA3+4hrSfLuKGGsunzs3vlRYmuIvxAGjTI7Uio=;
 b=VchgkjG8ndJAcipBRAuZiCBo4qoK4yvtJ6LCpIdn4J23FsB7lVFdnzyBf1TwKZjyAJ
 XD6A+YakpMXvOa7NsdibXsmA9pQh+m4gjeeg5pmSgq6FPtuM/OXm44MDSw63xjiUBcMX
 pakP6AEPOf8AEvQl7ERLM4ITVO3UO+b7+F090iz2MJmZP6d9Uqw11E2SggutkFbKjVbe
 lVoaSv5MuqCgRyMCMQwpKfZJ2XqOql8s0CK5iPCzY+c+Tu/0YaYWqMeZdzi0gOD8nJpC
 EoT4aEXPFyDXM8Cckxknt5PQd7BQFN/I6xL1JK9e6rl8f3injPcygGiugwnxfT1vzQYq
 5/rw==
X-Gm-Message-State: AOAM5326bVW990Eg1hcr099t+Dx28FdbTr11NCp3BXoGf9H3xXq/W3sX
 X6yNtFkceJA796x2cA1relrA8RIrk0U=
X-Google-Smtp-Source: ABdhPJywxpNyVEGWy1EoVT520byMEvSNSQ7KuJFwIcQ0HFqE9elOot307+Rk2bbi5H30IfAG0VYAeg==
X-Received: by 2002:a05:600c:3203:: with SMTP id
 r3mr14715766wmp.175.1632389737868; 
 Thu, 23 Sep 2021 02:35:37 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id c135sm8862776wme.6.2021.09.23.02.35.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 02:35:37 -0700 (PDT)
Message-ID: <211c4f2e-2fae-6ff2-5d16-0fed8dfec519@amsat.org>
Date: Thu, 23 Sep 2021 11:35:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 01/20] nubus: add comment indicating reference documents
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
 <20210923091308.13832-2-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210923091308.13832-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/21 11:12, Mark Cave-Ayland wrote:
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/nubus/nubus-bus.c | 8 ++++++++
>   1 file changed, 8 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

