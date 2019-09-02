Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61458A5418
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Sep 2019 12:35:29 +0200 (CEST)
Received: from localhost ([::1]:34878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i4jgG-0007DH-Dw
	for lists+qemu-devel@lfdr.de; Mon, 02 Sep 2019 06:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54848)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i4jSk-0004fC-Lr
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 06:21:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i4jSj-0004HN-KL
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 06:21:30 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44136)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i4jSj-0004GC-Eh
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 06:21:29 -0400
Received: by mail-wr1-x436.google.com with SMTP id 30so2485655wrk.11
 for <qemu-devel@nongnu.org>; Mon, 02 Sep 2019 03:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U0PDzau2To6K5mMDa/4SEuZ2KSdwKoDziD6MI+XI7jk=;
 b=VLgwAIkNdshVSfsKZdAiqHQOZuT/Bl8zfW8S9/IYsuSFD0JlwDFHj4R/8oO718yDig
 PQNgbTMjRR5lnlp40zv9FsRNXGzWenAp8dW0Npu6aKmqYbu97Tj+nmQmtoeJCFhjrlt6
 VTz0MH699tpuT0PUIQaqjYyuX0aligK7dbsQhIZ0+WUneFAK6al76zZq781tG45L8Trg
 eGFeyT5/sJcEL7XhRylQjOfC2SYcGGM4ixKJnaQ8TUu5BlN0zx3ZichQqLCu9a/lrAOW
 0QgU6g8Hqbp70KCxL4DXuKKysCGv4y3xOZuU+Ln/qrHsiuQx6ntDJiRElPQbsMYBJzuc
 j45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U0PDzau2To6K5mMDa/4SEuZ2KSdwKoDziD6MI+XI7jk=;
 b=PaOYNlcwsJfh1YvAeEf6IgAAAWXoB1d1asNntR+vxxjXhxRk3jjoIObCAQx3LbWxpQ
 EIgnIErtcA7n3oH/gijETWgNmOh/lqojNt9xaZadM8C6IsNs35lSTyJgXR6v9LJhqnW8
 vAyIZQy+R7VoeJe5yPgGymMzud1gUX7Bpk1E8p4x/dCUQollWcNIRMLK81zRlez8NpXD
 7jZ8ifydTficepLIs65Pgn2RvUcqw3jdK/4psV3yly9ayheDUqEsM6T2NfqE/ojnV4Fv
 /BqbseGjEPxsOVZ9t1C6EBRT46IpXukvYyeIEO/Plui34zVPCbKlOuEom0YrE409agpX
 SUZQ==
X-Gm-Message-State: APjAAAW13YwxJKZlU1mqDB04P8og/SuuYl19XVUQdyFFXRjEHLlt1yWE
 /eqehhmzc5W1xhRyGhpjdYqTsQ==
X-Google-Smtp-Source: APXvYqwG4u8tZhpYzh0C+YZhW0mzz0JRDPpfeKE3KLTZxu3xbhqG/KrHe/TgrsQGtaMOQFEE8MghBA==
X-Received: by 2002:adf:ecc3:: with SMTP id s3mr35931239wro.302.1567419686789; 
 Mon, 02 Sep 2019 03:21:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f23sm11840197wmf.1.2019.09.02.03.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 03:21:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8BEB61FF91;
 Mon,  2 Sep 2019 11:21:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Date: Mon,  2 Sep 2019 11:21:14 +0100
Message-Id: <20190902102122.1128-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190902102122.1128-1-alex.bennee@linaro.org>
References: <20190902102122.1128-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::436
Subject: [Qemu-devel] [PULL 04/12] contrib/gitdm: Add armbru@pond.sub.org to
 group-map-redhat
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

Just to get the (few) accidental uses of my private e-mail address
attributed correctly.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20190822122350.29852-3-armbru@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/contrib/gitdm/group-map-redhat b/contrib/gitdm/group-map-redhat
index 6d05c6b54fd..d15db2d35e1 100644
--- a/contrib/gitdm/group-map-redhat
+++ b/contrib/gitdm/group-map-redhat
@@ -5,3 +5,4 @@
 david@gibson.dropbear.id.au
 laurent@vivier.eu
 pjp@fedoraproject.org
+armbru@pond.sub.org
-- 
2.20.1


