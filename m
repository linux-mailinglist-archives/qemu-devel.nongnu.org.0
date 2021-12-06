Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 201694696F1
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 14:24:53 +0100 (CET)
Received: from localhost ([::1]:39540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muDz9-0004Pc-QH
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 08:24:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muDsT-00071T-Sr; Mon, 06 Dec 2021 08:17:57 -0500
Received: from [2a00:1450:4864:20::42a] (port=46991
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muDsS-0006QX-AP; Mon, 06 Dec 2021 08:17:57 -0500
Received: by mail-wr1-x42a.google.com with SMTP id u1so22289496wru.13;
 Mon, 06 Dec 2021 05:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=801d3UYfgo1vv3A4AG+QTld3QJ10VtHI+ftBa1BWzWU=;
 b=FdMHfojChDCfzKdiHHSVzyY/OIFu7ehpxVVXFSo3xTpMk0HM8k5vTnYLklwOvFZDCY
 CmFtyl5LOK5HPcHaSExC7GaynX1129IoVZOSJ2uEGGPhO+npBpbPzslQZVdPlbZ4yLeD
 vbUZCJrIjC7vbS+Jfdu21SBUyih9YFvy3wretG23K1d8T0t1mvwA0oboGO5PL1je1xRi
 QcxGu7DVpY11we5Q9Y1/4ngNkwnSoAO+RqUhhWM6fV4eOrH91LGCkrYf0ACBXqEaX0cx
 u3XfE7Nlk4noE1iDFy0puqWonRGtXDk68JO4bToRcyE8kfoOhGkiLAxdnkBQFUckIW3x
 FnEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=801d3UYfgo1vv3A4AG+QTld3QJ10VtHI+ftBa1BWzWU=;
 b=u1wDaMQ1QTAfuGY+HrzVv+wxEEaYzSspyqi8yT0mPfV00jlppQWRYZOLtRZjsdarTU
 LKKXPftsik1eP7aH1ONGRbY5mE96ITzRs8pUbI99UcL33/LE+adr8E5Jil6g2xrLgZAv
 RpNcziMeLjbHw9eY2AIaFwbe6Io0Nfp3k5EnMTnofTc63vo3e1sc0RaJd/EL6Zw7KPMi
 zv0WpV6SJVvempZfwl4nPdoh3s5gry+VGMmP3J+seFJj9uL42JxvppY3zS3ke5PNno0P
 l+DNc2m+NKW45jQ/+UCEOhtPLLmkONVUA/dZiUKtgGZUKinqpHmr4oeT6AcBdl4Fy77T
 6U5A==
X-Gm-Message-State: AOAM5319Zg9jueOrWG03wf+C+/DmhQ7vWmzx+9kJ+sifGpd6ohj2fjrl
 Z8Sebvt7jpagmgT3cpLfHf4=
X-Google-Smtp-Source: ABdhPJw6owvXHK65iH2MPmTjo/qOTxH5BMzX7W2TAkRdTcYByAwKJuGrMCygW72Xy6T9L01gvPvKOA==
X-Received: by 2002:adf:cd06:: with SMTP id w6mr44213766wrm.431.1638796674426; 
 Mon, 06 Dec 2021 05:17:54 -0800 (PST)
Received: from [192.168.1.36] (82.red-83-50-95.dynamicip.rima-tde.net.
 [83.50.95.82])
 by smtp.gmail.com with ESMTPSA id p19sm12246693wmq.4.2021.12.06.05.17.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 05:17:53 -0800 (PST)
Message-ID: <7e5c7bc3-1837-91a6-c793-3ed171c854eb@amsat.org>
Date: Mon, 6 Dec 2021 14:17:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 03/15] ppc: Add trace-events for DCR accesses
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211206103712.1866296-1-clg@kaod.org>
 <20211206103712.1866296-4-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211206103712.1866296-4-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.076,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/21 11:37, Cédric Le Goater wrote:
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/ppc/ppc.c        | 2 ++
>  hw/ppc/trace-events | 3 +++
>  2 files changed, 5 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

