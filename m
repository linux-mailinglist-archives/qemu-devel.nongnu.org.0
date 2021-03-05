Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AC432F27C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:27:29 +0100 (CET)
Received: from localhost ([::1]:54326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFAe-0005xm-Uh
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:27:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIEaj-0006vU-Nl
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:50:21 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIEai-0001Nj-1T
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:50:21 -0500
Received: by mail-wr1-x434.google.com with SMTP id v15so3011882wrx.4
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=U0dl+186hE06nAv+1dMykXHa7aau242UowlnbHcB+fk=;
 b=l02TtxiQBZCjN2Xj08RQirWom+Qp6oMh2ErqN+A6I3b1WYyoslbBGOo7cSPMoQdbSm
 za/kGvQ/6YUiP7BwSf0m00fRNPYsGrCPsMYPnh/iu5Ed96cPriF4dKpAJPgvxSatFsRj
 zjJzNy4gZkDsVaZ9+NYtn6iSsjC56sDGoGd1yr+fwdchjwGpaj6EWoFFksJKXn3jI3QD
 daBT/ufO9uzQW8tOlX841d4pzUZRZKjNQig+XpdpV32Hkk9BrRN/Fpyq0rSdty1gQPnx
 UhKl7Xzh0Xd3UuOgKsnFR2HcMQk2zG4uX2GNSqCuq6iwseYqBlkwubK6qUZX3Zy490l/
 8O0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=U0dl+186hE06nAv+1dMykXHa7aau242UowlnbHcB+fk=;
 b=Nz/vukqynrubsxn6oHTRi5kCUY2HMyiRLSXxByxu+DGtpeuessoZDPNrlvTM50HfTS
 YOAV/BPA3WgpGnmAVDcmZ63+RHZMVhnKihZ+JYFmImVtwFCNNp1432TeLFbldMLeda+U
 n5qKAtMW9Xuc6ISfH6NEZ4a5/JeaY59cBzKi7zZbByu70KK4AcKZJJ2RXJKyPgEBSKdr
 lKSKcF4Db9HXozjvwGsIhWQ7AvjWEXSR0XEOq05WeWJDifhb4PWYngEGOgM19H8wEnPG
 B+kdjvXDgFM+5vQ0IEaDUjW9LdZSjcGtR2SzG5V9XT3c21dDqPnwf6lt//qUOG9bw++u
 j+HA==
X-Gm-Message-State: AOAM533PE/PEk0NWNZBgOXi+LJMek1zOv+jTCRhMT/E9wKuKvwj03dmu
 jdwkz+mRsmTn2VUmSL/M87FTh9o6vOHhMw==
X-Google-Smtp-Source: ABdhPJx3YzMxZBxVxzLDKg76U/SMLV2xAyhT4N40JkTpZpQoYjBGYku8hdxbieMFKgOQMGv5o9bM5Q==
X-Received: by 2002:a5d:6a49:: with SMTP id t9mr10776366wrw.131.1614966618380; 
 Fri, 05 Mar 2021 09:50:18 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d16sm5407764wrx.79.2021.03.05.09.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:50:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C5BB21FF7E;
 Fri,  5 Mar 2021 17:50:16 +0000 (GMT)
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
 <20210302175741.1079851-7-richard.henderson@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 06/27] tcg: Manage splitwx in tc_ptr_to_region_tree by hand
Date: Fri, 05 Mar 2021 17:50:12 +0000
In-reply-to: <20210302175741.1079851-7-richard.henderson@linaro.org>
Message-ID: <87ft19ebhj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The use in tcg_tb_lookup is given a random pc that comes from the pc
> of a signal handler.  Do not assert that the pointer is already within
> the code gen buffer at all, much less the writable mirror of it.
>
> Fixes: db0c51a3803
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

