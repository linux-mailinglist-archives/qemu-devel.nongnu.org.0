Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8733164A2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 12:08:53 +0100 (CET)
Received: from localhost ([::1]:52272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9nMa-0003B8-Ir
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 06:08:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l9nKZ-0001sj-OC; Wed, 10 Feb 2021 06:06:48 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:43073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l9nKV-0001XC-QF; Wed, 10 Feb 2021 06:06:47 -0500
Received: by mail-pl1-x62b.google.com with SMTP id 8so1002557plc.10;
 Wed, 10 Feb 2021 03:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zUbhrCMSLzwuiWZ12dT0OLDg6E64EjUnANdVaEztWe0=;
 b=RonklV539UF4owzvj07MbB/IxWxa7GvkPI44l0PND0kLb+q3AxyZhmczxGZLN0JLul
 NKqn4f8oxgmTsnuDsflaNkgK34+9AdWLvoueb8tQLtKxEqySAZIiAYEC6dTs4vTgq3zQ
 Z8UcLO17lW0rqUHKNIej0VEQcJMBBcyTbayYJr4NtnDB4wSmJVFU8ZU6yK0NPWp0fNzi
 0MIdVxM5f8B4Q1/JC4I/SH/C9zRRW4GO3Pa1I9DVRQ/VEd2SDTYdl33ih0RUjfjD78Gv
 pG0XZ2U15XU+wqhv7XFaxU4u5+m2F6J+rGhgx92xmo/YHFCDi5FivQJ9JSWSI7skN4zv
 pJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zUbhrCMSLzwuiWZ12dT0OLDg6E64EjUnANdVaEztWe0=;
 b=fV/gQ9v3S9NM1ZqBN1JiVrRtnb0JH2ffPdIvykd7+zNZiAJh8SPaI1zkRtk8qBb+/O
 ma1sKVa4rDscC520iEvFLEoJ0G9rFI1qVchdSQEBKidFipxIG//AegJzb/S3wHarXn5n
 L9st6ZDGuoFnMSeKvrRyzMDSM3GwEyq1/D4ZxeYESHgEPaZ5HDpEtZwZnbl90nUfBAQ2
 qc2LSTKOXnIAP8FswMd1gkZQ+NfvVDSUl74f1Lo+tqjDOuYM6V0OVNwv4CoIDICqVRzX
 XtEQ2Nlzy6XGFdZna1fFKEedZGrqcS7CaDs1Y1GJshf7mtAn8SNuV1X3p0GiaHRIpCTM
 OTAg==
X-Gm-Message-State: AOAM533Rvcq4pxcrWUXWZYZY1SHqmBfprEWBk3QUxgVU/DwLM/9BqoTt
 CvGdkKiSvxfjBzzpZsUlaBw=
X-Google-Smtp-Source: ABdhPJwHENTKnX7yg2mJcJNDxaPnSW+daFWWr7Xg6NO+8he3JYKjZfX9hr/qGCCs13gIOcu5pmsFcA==
X-Received: by 2002:a17:90a:6393:: with SMTP id
 f19mr2606170pjj.230.1612955202047; 
 Wed, 10 Feb 2021 03:06:42 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id s13sm2059762pgq.40.2021.02.10.03.06.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Feb 2021 03:06:41 -0800 (PST)
Date: Wed, 10 Feb 2021 20:06:38 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 1/2] hw/block/nvme: add oncs device parameter
Message-ID: <20210210110638.GB9664@localhost.localdomain>
References: <20210210070646.730110-1-its@irrelevant.dk>
 <20210210070646.730110-2-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210210070646.730110-2-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x62b.google.com
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
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-02-10 08:06:45, Klaus Jensen wrote:
> From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> 
> Add the 'oncs' nvme device parameter to allow optional features to be
> enabled/disabled explicitly. Since most of these are optional commands,
> make the CSE log pages dynamic to account for the value of ONCS.
> 
> Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>

