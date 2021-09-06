Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A4C401904
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 11:42:02 +0200 (CEST)
Received: from localhost ([::1]:34572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNB8b-0000hd-AW
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 05:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mNB6D-00073H-R2
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 05:39:35 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:43735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mNB66-0001je-RC
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 05:39:33 -0400
Received: by mail-pf1-x435.google.com with SMTP id f65so1639308pfb.10
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 02:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LfikNlym+maBFavPQEKwtwVqixV7xzp4p6hLYVxRv/Q=;
 b=iMptgOE3vpsyJsJc9swdtnDMOGDcI1ul+pJFSr0Fp4ixblGoDL7wpfnbqPa748RRbJ
 naItx9pJHWJj+tQANDo7qYuQvPogZmVF1fvBZTJlH8BofN0gPmT5P4StgMlKkkOtNk+O
 hsCnrrpvOpZaFuxtpvQBcL2G/rv9XjfV0WN8hoba+FjiGll/Yg5RN2V/cKZui7Zwiz18
 5VMKQWyoFfzQivXTjEEk4QbsHmmUFD1a1Oj5SHLp6G6uvAUFpZk4Kf8c1CqESrRe4nnY
 YYuVj+2WpwfZSdl0RnBWg1R13Ik3EUbEzKvWKdSBAfWpAfDcPUnsciQBrjS+UcgaX0gN
 9aLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LfikNlym+maBFavPQEKwtwVqixV7xzp4p6hLYVxRv/Q=;
 b=EMNCq61ya8uUyd+E5stcfmd0yn6Ggc4NKwDMLrK2nPefOg9O2VccNuFH/R00pVQqlX
 Um82dqnEN3cvDjUmOFtXPoryoaU4AcyvenK21iUTfGyHlZwUxTic1ZuYfhtP9Q5u9ZTD
 YyYKZ3mtS/fUp52yMW/WRydZ8lIHddBap8zgOajpKomzD+4hrKBo3cJIslaK47qtqXd9
 r52f2f1cXPLhB3LBAS0suLNXJD68XyxBz1jnFnDswxMr0mNswmMgA/XVVpLGXIQ2mNSo
 sVRwi5Ae/tGkVeoL2912Lv8qp9uDA/hDr5UfQaMS4VYstat6Es7XTpBdewzvcDTSB3cR
 blrg==
X-Gm-Message-State: AOAM531aqL/2b7B80tp2tp6lzA0XeQvFzSTb7CYJczeollMDjSpTESEM
 eFqWNfm4WlHZ1aBDvln2BFe02Gqb3F7z8g==
X-Google-Smtp-Source: ABdhPJx5D81DtuL5E3qaDhawtbik51BlPSfBWSxD4QhZhFrrXXz8vAGRYxHm0xOUnuKISBpEjbg7BQ==
X-Received: by 2002:a63:1309:: with SMTP id i9mr11721320pgl.192.1630921163173; 
 Mon, 06 Sep 2021 02:39:23 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.142.175])
 by smtp.googlemail.com with ESMTPSA id
 z131sm7111183pfc.159.2021.09.06.02.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 02:39:22 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: Add a unit test to exercize support for ACPI hotplug on multifunction
 bridges in q35 
Date: Mon,  6 Sep 2021 15:09:08 +0530
Message-Id: <20210906093911.2069140-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::435;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x435.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor/Michael :

Added a unit test to exercize the following commit :

d7346e614f4ec353 ("acpi: x86: pcihp: add support hotplug on multifunction bridges")

I had sent just the unit test earlier but since the review is getting delayed, I thought of sending
the whole patch set which can be now reviewed in totality.

Thanks
ani



