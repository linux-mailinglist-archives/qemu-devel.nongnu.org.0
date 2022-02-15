Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ED64B663D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 09:35:50 +0100 (CET)
Received: from localhost ([::1]:45932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJtJN-0002Wl-Ll
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 03:35:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nJtGV-0008Sq-Ab
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:32:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nJtGM-0006cZ-VX
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:32:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644913961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/lYuj1q0G/e5fohAucU6CRJsUenht4hAdP+PjzymoR8=;
 b=Lmp9ff2t/WjbAnlwrOY//tPAOMmgSCnR2+S+ENJyIJHC7nzekx8YCyfkPNANoRQmQVDt19
 rSraHyy8EzMTA7GM2qelqslHbYBM8gFTa2oYlh7f13gKFBK62jQjv3fpCfNNqFwtHoOPGS
 YSUpuvA5RYzCMpJ9uTZhgWv9PGGrouQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-46sj8ZzmPnms2Ai94L_Fwg-1; Tue, 15 Feb 2022 03:32:39 -0500
X-MC-Unique: 46sj8ZzmPnms2Ai94L_Fwg-1
Received: by mail-ej1-f70.google.com with SMTP id
 13-20020a170906328d00b006982d0888a4so6908120ejw.9
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 00:32:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/lYuj1q0G/e5fohAucU6CRJsUenht4hAdP+PjzymoR8=;
 b=5dUYS6o10VjaKGbRt/UIAEoKUBNSJc08hOCdqVp5gWtbD6O3nVnm8hTtiYpo9vskVM
 lzypyyB0mmxjAMMgVMZ2wA8PCNgpyGDyqQfMvp5XrnqvV95c8d4YKnVauVLUMu3SrpnI
 MdAabA1Iph3ZFu+7Q6IXnEzo1m1xIxJs61GqqBczyVAtsZ5kuPrHKBW+SI+itDXfwbns
 UEA0uLpKJ0yNsdjeW++Jc1jEBKVgzW+gCXFI0d77tbEfVjR0tX6bGkrQ8b+nTBB158qy
 /h4TpKrHX0IxK3maY0TzljraiFhlQJ+Yv9YXYEfy5dD4W3xbS6tNHsrQs6q1XGGw70ol
 nNzA==
X-Gm-Message-State: AOAM531Zt9v1ZjpoCeygBE6enCyC1ERUYeNtQhl2/iEho2fhl5kvICvY
 7+Gr2SO8+OnFRdBXGRy2MKLLI+iaW1xflgHVebSuTOmtaCfLddhkotRPFX18S7BKX07Svp0aKJB
 xGyIFxg9QP02/XD8=
X-Received: by 2002:a17:906:7812:: with SMTP id
 u18mr2043040ejm.335.1644913958756; 
 Tue, 15 Feb 2022 00:32:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqC9Yp4rL47jTdrkbfpjLgdXao+G7dsGjXaJNRqKeR5LURBCorpqJZBPXNUfjxBB8/xltTuA==
X-Received: by 2002:a17:906:7812:: with SMTP id
 u18mr2043027ejm.335.1644913958540; 
 Tue, 15 Feb 2022 00:32:38 -0800 (PST)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id z6sm6153812edb.69.2022.02.15.00.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 00:32:38 -0800 (PST)
Date: Tue, 15 Feb 2022 09:32:36 +0100
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH] hw/arm/virt: Fix CPU's default NUMA node ID
Message-ID: <20220215083236.tt2ajffkdq3psmxw@gator>
References: <20220126052410.36380-1-gshan@redhat.com>
 <20220126101447.5d4f01f9@redhat.com>
 <f5780366-7c6e-1643-d471-1304ce6584ca@huawei.com>
 <5c99b245-e118-f7bd-4a4f-2c865bacaa75@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5c99b245-e118-f7bd-4a4f-2c865bacaa75@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, "wangyanan \(Y\)" <wangyanan55@huawei.com>,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 04:19:01PM +0800, Gavin Shan wrote:
> The issue isn't related to CPU topology directly. It's actually related
> to the fact: the default NUMA node ID will be picked for one particular
> CPU if the associated NUMA node ID isn't provided by users explicitly.
> So it's related to the CPU-to-NUMA association.
> 
> For example, the CPU-to-NUMA association is breaking socket boundary
> without the code change included in this patch when the guest is booted
> with the command lines like below. With this patch applied, the CPU-to-NUMA
> association is following socket boundary, to make Linux guest happy.

Gavin,

Please look at Igor's request for more information. Are we sure that a
socket is a NUMA node boundary? Are we sure we can assume an even
distribution for sockets to nodes or nodes to sockets? If so, where is
that documented?

Thanks,
drew


