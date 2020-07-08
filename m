Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B68219125
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jul 2020 22:09:01 +0200 (CEST)
Received: from localhost ([::1]:41144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtGNI-0000SJ-7R
	for lists+qemu-devel@lfdr.de; Wed, 08 Jul 2020 16:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1jtGMZ-0008TE-EN
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 16:08:15 -0400
Received: from relay68.bu.edu ([128.197.228.73]:53579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1jtGMY-00004z-0e
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 16:08:15 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 068K6q6p021976
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 8 Jul 2020 16:06:55 -0400
Date: Wed, 8 Jul 2020 16:06:52 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Li Qiang <liq3ea@163.com>
Subject: Re: build error of unused function as MACRO
 G_DEFINE_AUTOPTR_CLEANUP_FUNC expand
Message-ID: <20200708200652.jizypk4yi7rapr4l@mozz.bu.edu>
References: <5F05E942.FB9110.20278@mail-m971.mail.163.com>
 <b02161d0-a027-5018-af05-8ccbc5c90cc9@redhat.com>
 <20200708192339.ex4ygaebjekxk2qc@mozz.bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200708192339.ex4ygaebjekxk2qc@mozz.bu.edu>
User-Agent: NeoMutt/20180716
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/08 16:08:13
X-ACL-Warn: Detected OS   = Linux 2.6.x
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "liq3ea@gmail.com" <liq3ea@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 200708 1523, Alexander Bulekov wrote:
> 
> Looks like I forgot a header... I'll send fixes for both of these
> issues.

Hi Li,
I just CCed you on the series. Since, I was not able to reproduce the
GLib error, I would appreciate if you can check whether the change to
the ./configure script (patch 1/2) fixes the problem for you.
Thank you
-Alex

