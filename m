Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02003177A92
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 16:37:25 +0100 (CET)
Received: from localhost ([::1]:49122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j99bo-0007AE-2E
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 10:37:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47183)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jwsu1986@gmail.com>) id 1j99al-0006Us-Uj
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 10:36:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jwsu1986@gmail.com>) id 1j99al-0002iR-41
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 10:36:19 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:40884)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jwsu1986@gmail.com>) id 1j99al-0002iI-07
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 10:36:19 -0500
Received: by mail-oi1-x22e.google.com with SMTP id j80so3420528oih.7
 for <qemu-devel@nongnu.org>; Tue, 03 Mar 2020 07:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=CO7Uz8AGna+h6PUzfBlbwU0xtntpDnmxOND4mtlTH0A=;
 b=VzTfoZQ4eeJZfEpQgfYXEPAQIAwB7jliusDB8+69q0k4Vg2oDsH93/3y92aZIEEt49
 ocw9k0aRd/lz7kzQnKKJN2RM2RqH9RHtmGNtSg2RcY3xrbhY4UM9LpDiakXjUgDEJefS
 BAWHoFk6ZBzMbxli07ng2jZFc7d/EjLtbsDilF1xigXqd2OhRzwmt6f1AmS5SH+xNA7M
 2QzgDIFZ05DE7P60mR0JnZq8QhX3KG+7WN6sEyZ4lXknN+ctqz+rU3o5o4APORPkhgC3
 sM5Uo1tnGEFtppGB4Txzi/JkDIFGGIXMdnS3a7bXw8NtlKKME6OhgXl/p2Hvu5LUkZES
 GjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=CO7Uz8AGna+h6PUzfBlbwU0xtntpDnmxOND4mtlTH0A=;
 b=clQJaNP9xxoXBwfCr5APT/qQk15LCHVDtmzF7jg56VQmhVIuSffpVu2RvV1CT1zWla
 3erbTe53wOMnyadplBARVK43WXYFs6r+bMXgqGBoI9sc894j4IBUggtYniMGjK5seQvZ
 2Df1joLhafE5WarHYiqrmv+mCAadltaOOdUORyw60I5QgNKM/jDMGdir/JrTs02amg6H
 zp9l5ty2FNKRAo6dRjpAwVzGKUld4say3FGVjlBXcOnkd5/OWQ3HUCBMQlM1CRY3ByGi
 wiyOV3c5PVBnwGuweCbB+Hkd01aiizLITDhvpOKCHtF9jsnjb9uMiFjISbZNtS7BiyWR
 hdCA==
X-Gm-Message-State: ANhLgQ0QEhw1O/Y48vYhtT7tqyRF7+P4lsy341i2NySuyTbnDQZ8BPmg
 YPr0a6m4VdwxvwANajZSeWdq+z5RVe/8kHd7mt6KWrE+kRo=
X-Google-Smtp-Source: ADFU+vtWR959iZIQByMHZp/iFg+ncOf3RoDavMwHgeIUzR6y7XUQgv6r7SpH+swm9C7Lfn2Lowt4rO9KFTePm9gXH4Y=
X-Received: by 2002:aca:4987:: with SMTP id w129mr2954064oia.103.1583249777290; 
 Tue, 03 Mar 2020 07:36:17 -0800 (PST)
MIME-Version: 1.0
From: Jing-Wei Su <jwsu1986@gmail.com>
Date: Tue, 3 Mar 2020 23:36:06 +0800
Message-ID: <CAFKS8hWF_sRFpGpWGka-QQdy6eB5XvH39Z3tAOttHtSStEBi1A@mail.gmail.com>
Subject: COLO PVM and SVM's memory usages
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22e
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

Hello,

I've found the SVM consumes lots of memory than expected.
After booting the PVM and SVM with "-m 1024", PVM consumes 1GB, but
SVM consumes 3.2GB.
After PVM died and SVM takes over, the SVM consumes 2.1GB.

Any idea about why the SVM consumes lots of memory?
Thanks!

Memory usage of PVM
#~/libvirt# cat /proc/9661/status |grep VmRS
VmRSS:   1080828 kB

Memory usage of SVM
#~/libvirt# cat /proc/9696/status |grep VmRS
VmRSS:   3199476 kB

Memory usage of SVM after PVM died
# cat /proc/9696/status |grep VmRS
VmRSS:   2144200 kB

Sincerely,
Jing-Wei

