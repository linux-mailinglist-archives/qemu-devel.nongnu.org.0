Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7167FA0184
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 14:21:43 +0200 (CEST)
Received: from localhost ([::1]:35778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2wxJ-0001ni-8F
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 08:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47010)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i2wke-0001Qi-Jp
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 08:08:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i2wkd-0003zo-9V
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 08:08:36 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:33605)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i2wkd-0003zX-33
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 08:08:35 -0400
Received: by mail-wm1-x343.google.com with SMTP id r17so1612459wme.0
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 05:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XcTHFRC9i2WFejx4BecSd/XK7WjxEFySMuLBYAt9kJQ=;
 b=DZI9OXY42PAd6R+x4opQLcD+BU62C1PjgmssAZ83ZQzzENTvu1uig7LDBlp9vWxuqd
 vP7pNQTesWzKGFE1Xl3h4kf54z+S0B1Dn1fclQWD7ICxdtZMQHvTVzQYy6oY5/80tSya
 0h87PSkio49kLm1Vas46Scm3m+OBFFGwW1y+yzLS1KMPDHktNzxPiGNk4KjqC4GclMzk
 NiRp+dlmpunH3O4WioeJPVSkMhWRXBibqJGgDalBo0+og024ypM8Hgw9lwwGJ8OzaivK
 mTIq80pTYN+2jn5Df0u0z7d982YBtf6JUtVfKQshms+Dsl5zfVhcvGo9+ktKo1MFHfHN
 eGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XcTHFRC9i2WFejx4BecSd/XK7WjxEFySMuLBYAt9kJQ=;
 b=Rxp7rOPsOlKTqtsiEKW0mGsgQxc7Xgsj2TxgVtI20jYQT1Bg2ukLhZAmAnH2pt1gdQ
 Hw2C2gZsZQQGtFWdfYhqXpElLfT9mEg2VQs4/qebjiPJK9hUnM7x7AHTp6ko8bor87OZ
 YiSK+ju2mZ1kUeTnhTJJtbUudrKCUNiFB/G40LPoEfqKPqzGnng6NVEXAGKWktl2RG50
 rW6xseb6scmVTNEYFTUsb6TPurSvk5CKIZGCdViA4vKwrECBH4/rCwXZMDddAUMNgsqg
 J31Z3amoM+Qos0khLIuOiwWezcegUDUkVfdJqd0kf7d9MaG5/iUl6BcEwBE8NcyVJ5w1
 wmBQ==
X-Gm-Message-State: APjAAAVKx81FT5MIBO+x/kOhVhLhOPgkbIeGN/UY7qKh4YG+4SSU2OHG
 gU4iLxnMLAWzVeFbTig5mf0BNQ==
X-Google-Smtp-Source: APXvYqzyuII1YrjrwA4Hd/9rmgRrupacevg1X/UktDc6jHMB1QWKviRJEPyQFWBgauklc47PYqBq3Q==
X-Received: by 2002:a7b:c7c2:: with SMTP id z2mr4338763wmk.33.1566994113821;
 Wed, 28 Aug 2019 05:08:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p129sm3660276wme.9.2019.08.28.05.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 05:08:33 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7D7D31FF87;
 Wed, 28 Aug 2019 13:08:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 13:08:24 +0100
Message-Id: <20190828120832.9208-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-devel] [PATCH  v1 0/8] various gitdm and mailmap updates
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

With another release out of the door and KVM Forum approaching it is a
good time to clean up our gitdm stats. As usual updates for academic
institutions and individual contributors involve a bit of guess work
so I have CC'd those affected for their confirmation. There is also a
large amount of verbiage added to the mailmap and aliases files to
(hopefully) better explain what they are trying to do.

Alex Bennée (3):
  .mailmap/aliases: add some further commentary
  contrib/gitdm: add RT-RK to domain-map
  contrib/gitdm: add more entries individuals and academics

Markus Armbruster (2):
  contrib/gitdm: filetype interface is not in order, fix
  contrib/gitdm: Add armbru@pond.sub.org to group-map-redhat

Philippe Mathieu-Daudé (3):
  mailmap: Reorder by sections
  mailmap: Update philmd email address
  mailmap: Add many entries to improve 'git shortlog' statistics

 .mailmap                            | 137 ++++++++++++++++++++++++++--
 contrib/gitdm/aliases               |  20 +++-
 contrib/gitdm/domain-map            |   1 +
 contrib/gitdm/filetypes.txt         |   2 +-
 contrib/gitdm/group-map-academics   |   3 +
 contrib/gitdm/group-map-individuals |   7 +-
 contrib/gitdm/group-map-redhat      |   1 +
 7 files changed, 159 insertions(+), 12 deletions(-)

-- 
2.20.1


