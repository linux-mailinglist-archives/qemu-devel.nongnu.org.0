Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BC86070A4
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 09:02:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olm2b-0004pm-Cz
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:02:01 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olm1e-0003d9-R7
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:01:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1olm1W-0003HT-05
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:00:54 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1olm1T-0008Br-0l
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:00:53 -0400
Received: by mail-ed1-x52e.google.com with SMTP id l22so2922360edj.5
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=c6P1kJ3+RZCXmOOnzZhCwC+wtSAstY5MFcuyoarUrWY=;
 b=EjTarj4ctnZDyQ+NGNhHsvKC51EgZzpuLShYbWBZKY71J7GG+iIXyIVy6rflEoi9P3
 Dmah9+mbIrDu4oV8201t7eO51odq62juRUo/Ha+2RYpJJbwdZkHrjJKfWK3RNyjupV7s
 Dq5SpspOF6eFghaEQqrGQXZJWcqAfojKNS8nvby4etz2KN0y3oavQnlEO+3Wu1yef7Yv
 /niYspcPaM/WHJ8rHsgBi3vjHlRSAVO97ZYv0Q78UBNZHbQIt4TlCvX5Z2xFzwJCfik/
 iJtD430jU7FpOsqKBb7W0ISupiU2zwoZsUbFRbTqL6AbtQ9TpKAubgVmV2p7VXWxEhQ8
 cqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c6P1kJ3+RZCXmOOnzZhCwC+wtSAstY5MFcuyoarUrWY=;
 b=m4GNODiia3eEt37/dqG92AM0iA6FuDoRtVz4nskzYN51HaQPhCis6HFjALhaoU0JhV
 Pgb0IiOx34SOTQTQi7K8htFbg4v6e7KO2kxaOK5NvvMpiTvE9QmwvFagbm+2ipNoD52A
 t2ZINf4U/NidXVENbP2eUPX6b75mtgYZ359/83i0GvIcZovNmMT17cyk8Ve9ZLNigCOT
 N1e5rO6aCLg7TwgHpZqs699I8ktDLySHzviE6534DBWUHtIWqzLJ2/uwurFsA0olToNH
 3JKMKknfXe8c68yPPTziqLS4AtpNWNc06kW6WOHxpbPYSLJYfFVNAGHLEYzoMwUzZbxA
 iCAw==
X-Gm-Message-State: ACrzQf0vMtQKGuzRcfhTvrswWQGFulg5pK8K3LLyBzOGM6TDXe1BK+3T
 8h13MPfoe/qjIA0ljI1Cwhd8gg==
X-Google-Smtp-Source: AMsMyM5HE/m/1FQtpOSC3wCM+ms8ocP9pfEoMyGYcQuK5E8qws8CjWyPfgBEUlcDIGsmIvaMsjg+ww==
X-Received: by 2002:a05:6402:3512:b0:45d:4f99:6151 with SMTP id
 b18-20020a056402351200b0045d4f996151mr15605559edd.74.1666335648763; 
 Fri, 21 Oct 2022 00:00:48 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
 by smtp.gmail.com with ESMTPSA id
 gf26-20020a170906e21a00b0078ae0fb3d11sm11216442ejb.54.2022.10.21.00.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:00:48 -0700 (PDT)
Date: Fri, 21 Oct 2022 09:00:47 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alistair@alistair23.me,
 peter.maydell@linaro.org, qemu-riscv@nongnu.org
Subject: Re: add qemu_fdt_setprop_strings
Message-ID: <20221021070047.225ngzlqqwsvgbqw@kamzik>
References: <20221021055808.342055-1-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221021055808.342055-1-qemu@ben.fluff.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Oct 21, 2022 at 06:58:02AM +0100, Ben Dooks wrote:
> Add a qemu_fdt_setprop_strings to set a string array into a device-tree.
> 
> Only minor updates from v4 to fix a couple of minor patch issues.

Please see the comments I made on patch 1 of the v4 series, they should
be addressed. Also, I'm pretty sure I gave r-b's on most, or the rest,
of the series, but I don't see those here in v5. And, please CC previous
reviewers when sending out new versions. Finally, why not generate this
cover letter with git-format-patch?

Thanks,
drew

