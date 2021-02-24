Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B557323B03
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 12:08:16 +0100 (CET)
Received: from localhost ([::1]:52946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEs1f-0005jd-7r
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 06:08:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <msuchanek@suse.de>) id 1lErzf-0004mo-Cr
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:06:11 -0500
Received: from mx2.suse.de ([195.135.220.15]:48716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <msuchanek@suse.de>) id 1lErze-0007JK-0p
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:06:11 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 37106ADDD;
 Wed, 24 Feb 2021 11:06:07 +0000 (UTC)
Date: Wed, 24 Feb 2021 12:06:05 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: Problem running functional tests from China
Message-ID: <20210224110605.GM6564@kitsune.suse.cz>
References: <60118671-cd47-1900-59c6-96782dd7e26c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <60118671-cd47-1900-59c6-96782dd7e26c@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Received-SPF: pass client-ip=195.135.220.15; envelope-from=msuchanek@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, avocado-devel <avocado-devel@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 24, 2021 at 10:29:15AM +0100, Philippe Mathieu-Daudé wrote:
> Just to inform the files hosted on github don't work when
> testing from China:

> 
> raw.githubusercontent.com resolves to 127.0.0.1

And from where does this come from?

Your local system, your ISP, ... ?

Thanks

Michal

