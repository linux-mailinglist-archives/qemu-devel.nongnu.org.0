Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 181713183C3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 03:56:32 +0100 (CET)
Received: from localhost ([::1]:42784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA29f-0004Xi-65
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 21:56:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lA28H-00041l-WA; Wed, 10 Feb 2021 21:55:06 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lA28G-0001ee-Fu; Wed, 10 Feb 2021 21:55:05 -0500
Received: by mail-pl1-x633.google.com with SMTP id z7so2476029plk.7;
 Wed, 10 Feb 2021 18:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BDq1DmFUfM/ll82MYVzwh72PrydALCEDMWdEQiTehbE=;
 b=hgfgvYqdxwqz1p5oGZYxkeIP17pQcd9fKKK2tZ2o0vKGtZrxOuA/nyi+F3FDUFUoQh
 XcRPa1DGmcBtnitU0i9SiPxS5vEpDshS7RODgiKz9rtBiaiQIyQi5aWPuR9vULNsJ+T/
 WhsHSHQDO4abfCvv4c1nenzS6Ov+HfZwG0A7cpo4MhsBCdQRW0VnT20eLK7FrQgIsKxE
 iywIsKUTJqhDL/EU92NEJ8m2uoDBgDLf+FgWO7iqeOZccNAdtkx9ZNxo2xaJ0NJVJ1Q2
 +SkG5qOLsVChTnEpDr62E+xsVQd2nkQs0rNk8rbpOWIkhjp8LOJ3kI6wj4AaaFnvRqts
 b1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BDq1DmFUfM/ll82MYVzwh72PrydALCEDMWdEQiTehbE=;
 b=BBUIwFeU6fAXbeiadaxFmUlttfzKqAHQG66gTq3qujkInKtn2wwvUqeDu8zoDrAriG
 yxVs+aZI7Q2vOK4J7ufGv9vSAdYq5QsI4xya9E9A5ZHArLXSBZUtKJac574dYgsOGmqZ
 MSs+MlZlEJxqR3jXK8qIc74ov2tsWYgUnXYHEJpZBuijWPvQhBzl7BqONzHFc2cd0GZA
 xP5LKIfsw1dejL7hq+3DxXMmjD/TQtErpJYFHt1RKiLUnLQ4TkfLHWJ7HRrk0MRVBigC
 wVwXau6mmOJyOjGOo+LHqK2Lqa6gefz8tYgFJxq5zz6IUTZhETK6JsVcmXjh6med8NfT
 Fa4A==
X-Gm-Message-State: AOAM532WqVxzHGFbNDN528qUFLfLzwlLHy7PjG92n/DipvbOlUwxQbij
 Minh3aMtvb1lrwSeFs3cELA=
X-Google-Smtp-Source: ABdhPJwx/UebLDIS/hUEqT6+BrRsWUGCXzYR6mHMmeYsGLObPUegerCjBr7Ki+QMusWyGeKUun2c2w==
X-Received: by 2002:a17:902:e54e:b029:e1:2817:f900 with SMTP id
 n14-20020a170902e54eb02900e12817f900mr5903266plf.15.1613012102748; 
 Wed, 10 Feb 2021 18:55:02 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id 21sm3540190pfh.56.2021.02.10.18.55.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Feb 2021 18:55:02 -0800 (PST)
Date: Thu, 11 Feb 2021 11:55:00 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 2/2] hw/nvme: move device-scoped functions
Message-ID: <20210211025500.GC24885@localhost.localdomain>
References: <20210209110826.585987-1-its@irrelevant.dk>
 <20210209110826.585987-3-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210209110826.585987-3-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x633.google.com
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
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-02-09 12:08:26, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Move a bunch of functions that are internal to a device out of the
> shared header.

May I ask why?  I think some kind of these helpers can stick onto the
header.

