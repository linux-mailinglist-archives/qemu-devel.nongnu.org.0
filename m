Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC574EAFCA
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 17:06:17 +0200 (CEST)
Received: from localhost ([::1]:53794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZDQG-0005v6-HU
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 11:06:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nZDMw-0002MA-26
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 11:02:50 -0400
Received: from [2a00:1450:4864:20::529] (port=42607
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nZDMq-0003vO-OS
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 11:02:49 -0400
Received: by mail-ed1-x529.google.com with SMTP id a17so21045611edm.9
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 08:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=EyGdIm9mA5hejPstR/qyEX3ZxkHZ6aIGc8L7MpnGRWWC3DxhDA8idz6OtuJX8ZmfGV
 Q5su6tl3Tx5Hpx/dWHk0ukVVt/ejoRDKR/GnzA/igWC1f4wwzNZNEvLL1sLZDCAs/3nN
 bmFTAO69wm5Q9zAhHtSnHR8aD45OzHUxiHxJP3o3okb3ZDaoVeXhh3oe26LLX4BKmDVV
 r80kVQ2NJSQnZrQtK/dRFKpMLvYDAyajHcJBKkAfU/fY5xD2OHONqtv/pqvq8uFFWj5M
 7zOuWDvI+eE5+k7z5T4QDl2Yx4ILIF1XQX/47FeRiCRgVN0bRIOm/mTN23HdvtJpPfji
 ZoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=dK61UJsgeIwvzOMv4nFrjBZXSrP5vJkbyyrll9yy3lmkdeaAQlZvn4uxIeBcpvyPKn
 JGXDRsRtPQiWFsyUnfYBMTig9M73Izp6LKex6vJ3jwWx7voDJbf8JZHamlnhFmxM3r4A
 EdVvcumxeaQlP62FSZJ4JMDLj+DDfIfMwBz1QS4Da7dAa8JE8R/SR0jeGePSDDt6ZCPX
 e0QWmg2T04hz24njWDJsaQgFLg3hXOw5M1epbRer8xlKoKdh2MwFmJPnX1mfZbtgcJDN
 SlliEueXBw4rfuIkBCwCotwNodma42SzplTdoLGO+L01VMjgmu0MGcYh0NDOrRh6hN+N
 bk2A==
X-Gm-Message-State: AOAM530bgcuhldBZBN/g1a2RhVY8U3tsrYCpFBuPZ2CfXY9fGKzHjoiu
 r/Ovnu3ukkZbiiMmGaAuJuI=
X-Google-Smtp-Source: ABdhPJxOaZaxwusUvHAr1LwPXqE5u021cte94ikte051MILtRgxK/wIy8Oq14SmLpp0crPoigcHv7g==
X-Received: by 2002:a05:6402:518e:b0:419:675b:abeb with SMTP id
 q14-20020a056402518e00b00419675babebmr5041625edd.279.1648566162848; 
 Tue, 29 Mar 2022 08:02:42 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:8ca6:a836:a237:fed1])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a1709060e4f00b006cdf4535cf2sm7144778eji.67.2022.03.29.08.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 08:02:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH v3] qapi,
 target/i386/sev: Add cpu0-id to query-sev-capabilities
Date: Tue, 29 Mar 2022 17:02:28 +0200
Message-Id: <20220329150229.878490-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228093014.882288-1-dovmurik@linux.ibm.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eric Blake <eblake@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks.

Paolo


