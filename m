Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E342A6268
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 11:44:19 +0100 (CET)
Received: from localhost ([::1]:37938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaGH4-0004vJ-FV
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 05:44:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kaG5G-0003aR-Ip
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 05:32:06 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:33107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kaG5E-0003cC-Oa
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 05:32:06 -0500
Received: by mail-ed1-x531.google.com with SMTP id v4so21922556edi.0
 for <qemu-devel@nongnu.org>; Wed, 04 Nov 2020 02:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CNkRNQ2A5P1a+ruSsZELzV9v7zw/9Sbq22PEJn9bZmg=;
 b=QHLmpCDLZYJnjHX0mv3/cbv3uREEUe45gJlAdUcZIFClqYyl/odidyqhy20BVlOkOq
 H3V58OdNU8JJfPPbWzQ876k9R8FZaJVFZ7Inn27GbdeyCrdz7uZjBdPSND/+CZ+e/UAl
 C9u1tVZGXT/RG45xmNForRHnzxj7o/x+FawzPEPqJNFU7CxBV6RwBsh5U2jtDiPY/v3i
 agjvA+r+eTZad5iRfzm0lj937/CAJ7PaM374GkI80++r6qeZXOnbOwINgXxDiy2WPPeT
 0IeoPTM+W05K4u1rNx/HPDxziMTWPznR5woJ+7HTT2TyknuZgX7tgwr4aYKpCBsXoG3G
 WdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CNkRNQ2A5P1a+ruSsZELzV9v7zw/9Sbq22PEJn9bZmg=;
 b=SiKc+A2dQ5sam+PyLReJl5yVF/PCrzMmFwB/O/ztp6e9yDmFdlMApCsE9QPFMYJvS/
 1h6vHZWE3l+Xd6Yhbw7vjwlpbfWX4Zr5Ipbo+OblSC8GCcdXrX0xgcm/5al1AFXcwhmX
 WJojdWJrvjxre7Rjq2hr7NSxAg26hbZnxGJm4KJbV7WiBQUvzIN2FmM5BdFnqp0fS1GL
 foEFJmR7NaCRoXnQM6vnFcEtSOeckXsRS1k5A8uDV/WABG3a/c5Y7y5m2P/wpEvCRx31
 tgt1JXFlpl5WF148GGVLxJcyPReljwe0qFlNDEao4GhdB5Jcv/bCwf0gxPaA+uBIxgwv
 4BVA==
X-Gm-Message-State: AOAM532gzJtePNtRr0ss1kStgpPDPHyFQabcBJfCLXa/PaJwQOZy2nm7
 6pTs+V/ZLWkL2MBG12G388Gj+Oa6PFQlr4ucKAEyo/thSmw=
X-Google-Smtp-Source: ABdhPJxULmZeXtqXD4B5GNeOrnRLD26qDi2QIUrxXdL9B0TeuOybuPODqw0dKQ834PNU3Y6/iiUFZGEiIZAKc9FxU3E=
X-Received: by 2002:a50:fa92:: with SMTP id w18mr5937850edr.44.1604485922410; 
 Wed, 04 Nov 2020 02:32:02 -0800 (PST)
MIME-Version: 1.0
References: <BY5PR02MB6772DD4A5DE5980A1F7459D9CAEF0@BY5PR02MB6772.namprd02.prod.outlook.com>
In-Reply-To: <BY5PR02MB6772DD4A5DE5980A1F7459D9CAEF0@BY5PR02MB6772.namprd02.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Nov 2020 10:31:50 +0000
Message-ID: <CAFEAcA-c3KdiB+Etq4TNBDp0OXb3-7m8K=7oVHci5X2Y+ymatg@mail.gmail.com>
Subject: Re: Debugging with rr
To: Sai Pavan Boddu <saipava@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 4 Nov 2020 at 06:11, Sai Pavan Boddu <saipava@xilinx.com> wrote:
> I tired debugging QEMU with rr version 4.1.0, on ubuntu 16.04. And I see below errors, any suggestions on the issue would be helpful

rr version 4.1.0 is pretty old -- it was released in 2016.
QEMU does some complicated stuff that in the past rr
needed fixes to handle. Start by trying the most recent
rr release (or rr from git if you like). If that doesn't
work then the rr folks are pretty responsive to bug reports.

thanks
-- PMM

