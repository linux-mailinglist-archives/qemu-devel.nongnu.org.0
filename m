Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B5A49B3F2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 13:29:41 +0100 (CET)
Received: from localhost ([::1]:33992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCKxA-0004iH-RC
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 07:29:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nCKp0-0005kA-Tq
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 07:21:15 -0500
Received: from [2607:f8b0:4864:20::52f] (port=33685
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nCKoy-0003YY-U3
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 07:21:14 -0500
Received: by mail-pg1-x52f.google.com with SMTP id 133so18166314pgb.0
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 04:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=oIEue83d/DFF1fUpwIguBgLBzRnMfoVU10V6aMhADbg=;
 b=NLYeUvsNIutxdK1DfnMgpf8bTaKUDNP+B5ETiNAZSJ0E8T+4D0MnQPrNP9Sy71LYGb
 FjYkyKHTfsR1fxyFF3W0gRuQ1/nzZLjLh3Rw5B9KtIh2Z78RkrROVYJR7R5EUoKnv/x9
 X7ZL2kShTrlSaaiZlph6Sguhik5Quko8tZDxj0rcc5a4qLUaLMzoNMThAx/XZZONa9X4
 7XD5EcCNw8YVrkt92NXHY6e3p94ZqJwa8Rj6SVzxVNNkSyv5AKUn32/6kTmh4wJEtbok
 LnOg9bwt+YJckJ6gKUYmx8kQ6FP/RZB9oikCZTPLWUxnz5EMAHZCY7aBkBfmNbyfmrdx
 tYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=oIEue83d/DFF1fUpwIguBgLBzRnMfoVU10V6aMhADbg=;
 b=r0J9Cf0kJ6Cv+sNYo48UYkCn/KlAV3tOw5e2CfapKKw0j47sK6fhhWxcgi2CVyCIDO
 5CEsVvqo3y0pQbmPMu5DGqMtkzJ3lD+t0/IpZXIlKwZiBfX0vVmxO48lx9Pf8aUYZeic
 TfPZuf1yfq+GZqrjXmDJil6GFuBYWy4H7gaURduzMwODfMLEdusAVASTlsRJGYT1W23S
 5lqulO8hq3UCJCC1xWlbitrOjCeSJRsJmsm9kG/uoU5Hw8yOqRPkwD3TaUDgtjF0ojsq
 9bPpmat/ikvSvYBGWtH+xJztRVyq76RJihlvGVXwvJ8QUgJT8iEyNoIZSCTPQe64lt4o
 GKQQ==
X-Gm-Message-State: AOAM532Y15MZrLN73AEdXuWGY+G0xzMVDPMLUkGR43JxW9koS3ttLpH6
 n+h95GlbS3Mp4Ge2D0LOV6Fc2Q==
X-Google-Smtp-Source: ABdhPJwlBZTddh6i3lCIlCPNzdhzU71bQeAaVU09dpLgCRZxW4ON1juJzivqOwSfxv7mfyIrfTkYcA==
X-Received: by 2002:a05:6a00:88f:b0:4bc:3b4e:255a with SMTP id
 q15-20020a056a00088f00b004bc3b4e255amr18415917pfj.79.1643113271315; 
 Tue, 25 Jan 2022 04:21:11 -0800 (PST)
Received: from [10.11.18.6] ([91.219.213.27])
 by smtp.googlemail.com with ESMTPSA id q13sm15409357pfj.63.2022.01.25.04.21.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jan 2022 04:21:10 -0800 (PST)
Date: Tue, 25 Jan 2022 17:51:04 +0530 (IST)
From: Ani Sinha <ani@anisinha.ca>
X-X-Sender: ani@athabasca.local
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v13 06/10] ACPI ERST: build the ACPI ERST table
In-Reply-To: <20220125070221-mutt-send-email-mst@kernel.org>
Message-ID: <alpine.OSX.2.20.2201251750300.42000@athabasca.local>
References: <1643044621-15892-1-git-send-email-eric.devolder@oracle.com>
 <1643044621-15892-7-git-send-email-eric.devolder@oracle.com>
 <alpine.DEB.2.22.394.2201251600060.1134355@anisinha-lenovo>
 <20220125070221-mutt-send-email-mst@kernel.org>
User-Agent: Alpine 2.20 (OSX 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::52f;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, imammedo@redhat.com,
 boris.ostrovsky@oracle.com, Eric DeVolder <eric.devolder@oracle.com>,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>
> I think these macros which in a hidden way use the bar0 variable really
> should be replaced with inline functions, improving type safety.
>

I second that.

