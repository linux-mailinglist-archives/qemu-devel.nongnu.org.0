Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A82D02B42D4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 12:30:26 +0100 (CET)
Received: from localhost ([::1]:57580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keciH-0007vW-I9
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 06:30:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1kechQ-0007QE-6I; Mon, 16 Nov 2020 06:29:32 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:38939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1kechO-0000PV-EZ; Mon, 16 Nov 2020 06:29:31 -0500
Received: by mail-pg1-x541.google.com with SMTP id p68so2477415pga.6;
 Mon, 16 Nov 2020 03:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Q7k6MejfRkJ3cuMNWoLTvt4zn6tcKBR8ISvOdbmAI7k=;
 b=lgrHSSs5zyU4ePTdEtLMhDOm9dw/awT/JzaDupKUEaL43n4UPckzy2np7HYvGK/eeC
 EBij4HJLO0w6WRAUHWMhKRngH+EoJEnWZJbTpmTqdANS+eMB7Nc6SB7NVykSxk5wlXF9
 bXjE3YL+grhQW9Glg4j/CmeK3z7gf7AwJ9AYppxTFi6PqxXM1QO5Ue0AMA+6WxyJXHIK
 dJv6DfixPan7ZewdJMqTebkRnkjodGBLdxzcaRI+k6tNMhpH5WOuIAIgkR7SNlLrrQbr
 ZTNJqqahf7YiheCC5y+CYJQdRSwyokiIiN1hrvIBlx1Cy4/BZG+YDenWCg7Iw+FDAhPQ
 PwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Q7k6MejfRkJ3cuMNWoLTvt4zn6tcKBR8ISvOdbmAI7k=;
 b=G7F9ROb85Ww5csQ5fThbr/ijBsO7ui2FZSjVGQi9RGlFWP/miIN0P0uOFhkvMCY0n/
 ebexgjUx9+opS++cbFaxAygrz7MYbrH0cyFJc1pkZsOVG/0hPe1w1pVXQopUp6PdJ/R4
 FEmfuYXEpQ4nhIzawaVNvvtfUsJ1bEGiHr7bo+WS+q3Igm8lo/NOUUox9tCmR19ari6N
 y8oxeRTsENeL6K/S9lLudqv/58VOO7sClUVwpm45sqhzvqCn4Xxw6fJ+QQKWxOuebpVy
 bOEvF6bG3d/daUenx8K+qJnjMd/LQdDpLkrHyrXI5H4r+3i6Y79qGr7PpX0Al9GJcF8v
 dlPw==
X-Gm-Message-State: AOAM5337NA8snjLWWvKmgm4mS6+ZuHAkSlTzTudqr2EIb0nKhgvwYYkY
 l6RjyofkE3GmB9vypdz95/U=
X-Google-Smtp-Source: ABdhPJyLFWOfF+48nRkmIoAvpKT/5xpyXnI4FR10hohIJ30SiGdh6nLcZ2MUcTnPCe0KTUBpIpxqLg==
X-Received: by 2002:aa7:9786:0:b029:18b:746d:629f with SMTP id
 o6-20020aa797860000b029018b746d629fmr13614180pfp.68.1605526168330; 
 Mon, 16 Nov 2020 03:29:28 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id m18sm11992592pfk.10.2020.11.16.03.29.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Nov 2020 03:29:27 -0800 (PST)
Date: Mon, 16 Nov 2020 20:29:25 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v8 1/5] hw/block/nvme: remove superfluous NvmeCtrl
 parameter
Message-ID: <20201116112925.GA7308@localhost.localdomain>
References: <20201112195945.819915-1-its@irrelevant.dk>
 <20201112195945.819915-2-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201112195945.819915-2-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12 20:59, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> nvme_check_bounds has no use of the NvmeCtrl parameter; remove it.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>

