Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE1A33F605
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:50:05 +0100 (CET)
Received: from localhost ([::1]:60940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZMx-00054p-EZ
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@diablo.13thmonkey.org>)
 id 1lMZAR-0003rB-Q2
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:37:07 -0400
Received: from 13thmonkey.org ([80.100.255.32]:65365
 helo=diablo.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@diablo.13thmonkey.org>) id 1lMZAQ-0006Gv-CK
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:37:07 -0400
Received: by diablo.13thmonkey.org (Postfix, from userid 103)
 id 4B097C13AFA; Wed, 17 Mar 2021 17:37:04 +0100 (CET)
Date: Wed, 17 Mar 2021 17:37:04 +0100
From: Reinoud Zandijk <reinoud@NetBSD.org>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH for-6.0] x86:acpi:piix4: reinitialize PM1.CNT on reset
Message-ID: <YFIwMI/qSlPdGZAn@diablo.13thmonkey.org>
References: <20210316202956.3041128-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316202956.3041128-1-imammedo@redhat.com>
Received-SPF: none client-ip=80.100.255.32;
 envelope-from=reinoud@diablo.13thmonkey.org; helo=diablo.13thmonkey.org
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: isaku.yamahata@intel.com, berrange@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, f4bug@amsat.org, pbonzini@redhat.com,
 isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reported-by: Reinoud Zandijk <reinoud@NetBSD.org>
Tested-by: Reinoud Zandijk <reinoud@NetBSD.org>

It works fine now with the patch


