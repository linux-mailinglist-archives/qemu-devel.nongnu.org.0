Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D3421A6BA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 20:15:09 +0200 (CEST)
Received: from localhost ([::1]:47018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtb4e-0002VQ-Dp
	for lists+qemu-devel@lfdr.de; Thu, 09 Jul 2020 14:15:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1jtb3n-00024B-84
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 14:14:15 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:40823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1jtb3k-0003LR-QN
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 14:14:15 -0400
Received: by mail-ed1-x52f.google.com with SMTP id b15so2556142edy.7
 for <qemu-devel@nongnu.org>; Thu, 09 Jul 2020 11:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20150623.gappssmtp.com; s=20150623;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=JvsSLTnNi+aLDp67k3aIMfpRY7ID6RKZSc4kO/Edqmc=;
 b=Pq/+VTQeIAsZ7vRs1QxmkPtCGCwEP5z9ZbSyjkDJZaHJLmB1vETv+CYsUC8usbhJjK
 Tsjb4UE/hkh+kQ/18DtxQO8xvAMHwXfzeUPjYIgA8aZ0+yIhvDCCHDKLl22VHOIuBP9c
 TzgSWE6AmWHrTY7bhSqOVgGxJGm4wljBVAfeccz4Pam9ePU33V9nnTgdmYJYk7aBjE9i
 yoChyn6rkphg061aBeWku+trdb/8HVnLcYbweU0jUSCtPfk5xFsjN73ZzK72gTpY6Yx8
 Tk+Tz/Zmuryz/j7mAo5Cuy7GUUXkH5MlYbC8u4arRx2yCBPgZI3Ujw5TN5JuqGL+ZlCB
 BTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=JvsSLTnNi+aLDp67k3aIMfpRY7ID6RKZSc4kO/Edqmc=;
 b=ldcw9wnzSeSBAFbeA1fXXiGgXc4CAVLu7lFtMRpQgFCobtiDvJaejytpRucwCLr2To
 ezAvq1eIMFMrdlP83BvRvwt/9hqpITBwuyrr5DhhsLarq63cnZ1qi+NAtsowhakFI+tK
 lZ1+Ce8VR3taI3GkFtWIsrk/Ii+PESowUsaUaTfA2JImffkoFTJKEwMW2dhFZP7hYHAG
 FThHBaNmrxnqFA0A4jpQq0scT6E08jA/RD/6oONIVal/MZVfQvQsmuhfhSOG1lkZMaQj
 rdALVzHe64OgoAeLYEkVEgRawDB6waUbXdTkrTivNyvjC2SzFqpDPMOLiP69qjHy075M
 yDHw==
X-Gm-Message-State: AOAM530Alj4ftvxBMurWvpQHGIA4fQNdxbn4ZXP7laE4FBuKRNzaxSKO
 7Vv+FKpxqJ+6olUYWFBTNCPl9DmtyqA=
X-Google-Smtp-Source: ABdhPJwgtkugQOpNJEMutszUirXyZ08kumLSO5pJ7B2ASxX52tMoRQ18RFfRVhF6OhY1MLrKLl6eIQ==
X-Received: by 2002:a05:6402:1494:: with SMTP id
 e20mr60886877edv.2.1594318450308; 
 Thu, 09 Jul 2020 11:14:10 -0700 (PDT)
Received: from wks.local ([86.121.22.151])
 by smtp.gmail.com with ESMTPSA id z25sm2208731ejd.38.2020.07.09.11.14.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Jul 2020 11:14:09 -0700 (PDT)
From: Liviu Ionescu <ilg@livius.net>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Separate notifications from list messages?
Message-Id: <E646BE29-B46F-4B56-ADF5-B0DC6CCEF422@livius.net>
Date: Thu, 9 Jul 2020 21:14:08 +0300
To: Qemu Developers <qemu-devel@nongnu.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Received-SPF: none client-ip=2a00:1450:4864:20::52f;
 envelope-from=ilg@livius.net; helo=mail-ed1-x52f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now, with the migration to GitLab under way, could you consider =
separating the notifications sent by GitLab from the messages exchanged =
on the list?


I mean allowing those interested in receiving the notifications to =
explicitly subscribe to them, and no longer sending all of them to the =
full list.


Regards,

Liviu


