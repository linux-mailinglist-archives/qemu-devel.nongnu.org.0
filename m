Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F7822E19D
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jul 2020 19:20:14 +0200 (CEST)
Received: from localhost ([::1]:36668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jzkJp-00016a-8S
	for lists+qemu-devel@lfdr.de; Sun, 26 Jul 2020 13:20:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1jzkIr-0000fj-Ln
 for qemu-devel@nongnu.org; Sun, 26 Jul 2020 13:19:13 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:43523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1jzkIn-0007Qp-SR
 for qemu-devel@nongnu.org; Sun, 26 Jul 2020 13:19:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=Z+vJm6SOxrPPUAbIlCJdSlZ1CBxbqKvoUJH1PfLlFp4=; b=WhMdZ6AkFTwUqME5oRrztLKQgZ
 JwKEnw2syoUNE1xXwEuAQBJxGxDw8BH8wCNifz5WofkFDS0c9kHQgNsojzOBy/TMKGF0wtGf4DRCj
 w92GlhfO/75f+ivUhcZcb5ng3hIsljqH2NWR6DVLYDbsS8uAMoulw7AKTAVEg7xQl8lKBo17pIXh/
 yEqD/EGTlSl9XXG9MpxoKIrzGebQE5hPe4AOFaUSP3cxQCWlsNpzeU6OBjFuyifk+UkVVMgqrvX6S
 9WJ0lofLkUf3WE59legf2+IwbgJ/m/KEsSdq23GYlc+el1hgqzCEdv5WJgPON0il0TCmj6v6leTHI
 O+qPkpAA==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 2/3] cirrus.yml: Compile macOS and FreeBSD with -Werror
Date: Sun, 26 Jul 2020 19:19:03 +0200
Message-ID: <2063507.Rj2kWPf9UF@silver>
In-Reply-To: <CAPyFy2A-7gLhsCAdAohdnm9BDcHyR2y7EZK2nAKTkp0zYtYC9w@mail.gmail.com>
References: <20200724143220.32751-1-thuth@redhat.com>
 <20200724143220.32751-3-thuth@redhat.com>
 <CAPyFy2A-7gLhsCAdAohdnm9BDcHyR2y7EZK2nAKTkp0zYtYC9w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/26 13:19:06
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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

On Sonntag, 26. Juli 2020 18:14:11 CEST Ed Maste wrote:
> On Fri, 24 Jul 2020 at 10:32, Thomas Huth <thuth@redhat.com> wrote:
> > Compiler warnings currently go unnoticed in our FreeBSD and macOS builds,
> > since -Werror is only enabled for Linux and MinGW builds by default. So
> > let's enable them here now, too.
> 
> Reviewed-by: Ed Maste <emaste@freebsd.org>
> 
> for the FreeBSD change; I'm indifferent on which method is used to
> address the macos deprecation warnings.

Like I pointed out on my response to Peter, it is a bit risky to just blindly 
link against Apple's version of sasl on macOS. Say you compile qemu on a 
certain macOS version, then you run qemu again after an update of macOS 
without recompiling qemu, chances are that you get misbehaviours.

One solution would be bundling the qemu app along with sasl, so qemu would be 
forced to use that bundled sasl version instead of whatever Apple's version of 
sasl is installed on the system.

Another appraoch would be checking the system's sasl version on qemu startup 
by calling either sasl_version() or sasl_version_info() and comparing that 
with the version qemu was compiled with, and erroring out on doubt.

Or obvious last option: simply taking the risk by ignoring this potential 
issue. The SASL headers are still made available by Apple, which suggests that 
they don't break SASL 'too often'.

Your choice. ;-)

Best regards,
Christian Schoenebeck



