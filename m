Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2893E8F91
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 13:39:58 +0200 (CEST)
Received: from localhost ([::1]:57362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDmaT-0002Rh-5F
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 07:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kripper@imatronix.cl>)
 id 1mDmY2-0000ms-KG
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 07:37:26 -0400
Received: from ip27.imatronix.com ([200.63.97.108]:39122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kripper@imatronix.cl>)
 id 1mDmXy-00063s-PS
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 07:37:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=imatronix.cl; s=default; h=Content-Type:MIME-Version:Date:Message-ID:
 Subject:From:To:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uuRi5udfFB9Om42s6blg24KmiDrwtYgt3M4bww7paJQ=; b=HtIV2gS66etVd47BGbtkN4LXfi
 lIylkxHgQQoFjjI1IhDItAiONESyiWRJGkd9i8A7ch+k9SN5LvaHcur46POS2rOVO6eliQWJVOXCE
 HHKzhaAgHKk+/124pqmAqpnaymHexjuOxy3l3ALkBQ51LnT7cCNne8yh5qPITQF3p78OoD31uQhRY
 QmB4kuE7+pqZabFu1hFSXyytPVAAoYfz1SDVuGxj8WHltI54p4RB5Rnl2FMmJYDATSgWXuCC+lNSH
 89MWB3lf9Mql/ka1e/Fmp/xnPtACX4x19bbjvYwU4MKyPNnWDHXZsHatGR4RUrCjD8qAbnlRV3ZJd
 RKEa+DWA==;
Received: from [200.73.112.45]
 by cpanel.imatronix.com with esmtpsa (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.94.2) (envelope-from <kripper@imatronix.cl>)
 id 1mDmXF-0003AQ-1h   
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 07:36:36 -0400
To: qemu-devel@nongnu.org
From: Christopher Pereira <kripper@imatronix.cl>
Organization: IMATRONIX S.A.
Subject: qcow2 perfomance: read-only IO on the guest generates high write IO
 on the host
Message-ID: <55980bc8-97ad-77a4-1bb7-a086f2712ea1@imatronix.cl>
Date: Wed, 11 Aug 2021 07:36:33 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------46D1A7DF5CBA143D1E40EC95"
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.imatronix.com
X-AntiAbuse: Original Domain - nongnu.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - imatronix.cl
X-Get-Message-Sender-Via: cpanel.imatronix.com: authenticated_id:
 kripper@imatronix.cl
X-Authenticated-Sender: cpanel.imatronix.com: kripper@imatronix.cl
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Received-SPF: pass client-ip=200.63.97.108; envelope-from=kripper@imatronix.cl;
 helo=ip27.imatronix.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This is a multi-part message in MIME format.
--------------46D1A7DF5CBA143D1E40EC95
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm reading a directory with 5.000.000 files (2,4 GB) inside a guest 
using "find | grep -c".

On the host I saw high write IO (40 MB/s !) during over 1 hour using 
virt-top.

I later repeated the read-only operation inside the guest and no 
additional data was written on the host. The operation took only some 
seconds.

I believe QEMU was creating some kind of cache or metadata map the first 
time I accessed the inodes.

But I wonder why the cache or metadata map wasn't available the first 
time and why QEMU had to recreate it?

The VM has "compressed base <- snap 1" and base was converted without 
prealloc.

Is it because we created the base using convert without metadata 
prealloc and so the metadata map got lost?

I will do some experiments soon using convert + metadata prealloc and 
probably find out myself, but I will happy to read your comments and 
gain some additional insights.
If it the problem persists, I would try again without compression.

Additional info:

  * Guest fs is xfs.
  * (I believe the snapshot didn't significantly increase in size, but I
    would need to double check)
  * This is a production host with old QEMU emulator version 2.3.0
    (qemu-kvm-ev-2.3.0-31.el7_2.10.1)


--------------46D1A7DF5CBA143D1E40EC95
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,</p>
    <p>I'm reading a directory with 5.000.000 files (2,4 GB) inside a
      guest using "find | grep -c".<br>
    </p>
    <p>On the host I saw high write IO (40 MB/s !) during over 1 hour
      using virt-top.<br>
    </p>
    <p>I later repeated the read-only operation inside the guest and no
      additional data was written on the host. The operation took only
      some seconds.<br>
    </p>
    <p>I believe QEMU was creating some kind of cache or metadata map
      the first time I accessed the inodes.</p>
    <p>But I wonder why the cache or metadata map wasn't available the
      first time and why QEMU had to recreate it?</p>
    <p>The VM has "compressed base &lt;- snap 1" and base was converted
      without prealloc.</p>
    <p>Is it because we created the base using convert without metadata
      prealloc and so the metadata map got lost?</p>
    <p>I will do some experiments soon using convert + metadata prealloc
      and probably find out myself, but I will happy to read your
      comments and gain some additional insights.<br>
      If it the problem persists, I would try again without compression.<br>
    </p>
    <p>Additional info:<br>
    </p>
    <ul>
      <li>Guest fs is xfs.<br>
      </li>
      <li>(I believe the snapshot didn't significantly increase in size,
        but I would need to double check)</li>
      <li>This is a production host with old QEMU emulator version 2.3.0
        (qemu-kvm-ev-2.3.0-31.el7_2.10.1)</li>
    </ul>
  </body>
</html>

--------------46D1A7DF5CBA143D1E40EC95--

