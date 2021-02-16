Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D34531CA50
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 13:03:42 +0100 (CET)
Received: from localhost ([::1]:46484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBz4v-00029C-L0
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 07:03:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lBz3L-0001Ci-2G; Tue, 16 Feb 2021 07:02:03 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:51037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lBz3G-0005yO-Ko; Tue, 16 Feb 2021 07:02:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=GUBbb8DJVslE858dgI26g1ljCgqvK1R3zaQXSXaUxQo=; b=nM18WeT5xZcj24Wk9XOPUdIlu+
 t/5rq0ufU81LPaFDuIM0bOjv5+bt8K+svY8q8BJk9mw0k6spZKrt00cSDN8sjcd2nH2DSAyfYq5xC
 xat372iIrUgH6aMNRZS9YFBX2DWYmKTbxNHuk2lgCZrD/xmJtdnybwVgZW77fgDJvzJlm51sADesN
 dfMfFa0Z8E/kXJQVP5V1Suy5QdUvnIG+b28SjEnCtG4hvXtLsPKLtRGU25RkZxrMBdaWQ7qeILPLf
 3n+qlkEitMiBRc3V1p3DTB2xkEpSx3jejLiHngsCs5+FbhIKzHCKpBDWuIXackLZ6QNIJGZF59Kl0
 P1XjltstB9gJCP9B74XEMbuIPIsYThned5D26oY7ay434ioMhRFu+T/u/uLeHwX5H2tq6OQmsTJt2
 VTvIh2ACWxRVSru0rBRkCNLvhKr33pk6CcYRXdb/EnmJ2FUXv9RlHsrg24l0cqmZaEkS/ST9yU6Zi
 aDJdc5fWfJoS2+sQ7cW080Q0zubt2Wn2eCZXEiWZ1QvyNgOsC/BjUYAvjS6M87jqANT9dwJS/2u7f
 iMEudaBmKHU+0qqJpKKI3/znRcfvQhvKDEj9RF1WT/2U//L/gFpv05Awj8U320H4ulFdjXE/n4x9Z
 RSI5cpG3y/9KFuAYuoQ2WiO3VNYkcN1nvw/OO8qaU=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-trivial@nongnu.org,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] scripts/checkpatch: Improve the check for authors mangled
 by the mailing list
Date: Tue, 16 Feb 2021 13:01:34 +0100
Message-ID: <6113420.MkNRk1MDtq@silver>
In-Reply-To: <20210216071512.1199827-1-thuth@redhat.com>
References: <20210216071512.1199827-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Dienstag, 16. Februar 2021 08:15:12 CET Thomas Huth wrote:
> There were recently some patches on the list which had their "From:"
> line mangled like this:
> 
>  From: qemu_oss--- via <qemu-devel@nongnu.org>
> 
> Since our test in the checkpatch.pl script did not trigger here, the
> patches finally also ended up in a pull request, with the wrong author
> set. So let's improve the regular expression to also complain on
> these new patterns, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  scripts/checkpatch.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index e47ad878d8..7f194c842b 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -1499,7 +1499,7 @@ sub process {
>  			$is_patch = 1;
>  		}
> 
> -		if ($line =~ /^Author: .*via Qemu-devel.*<qemu-devel\@nongnu.org>/) {
> +		if ($line =~ /^(Author|From): .* via .*<qemu-devel\@nongnu.org>/) {
>  		    ERROR("Author email address is mangled by the mailing list\n" .
> $herecurr); }

I would probably generalize the pattern even a bit more:

		if ($line =~ /^(Author|From): .*<qemu-devel\@nongnu.org>/) {

Because mailman's precise sender-rewrite prefix changed couple times. But for 
now the change above will do as well of course.

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

Best regards,
Christian Schoenebeck



