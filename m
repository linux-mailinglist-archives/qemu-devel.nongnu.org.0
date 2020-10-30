Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4682A07D5
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 15:29:13 +0100 (CET)
Received: from localhost ([::1]:34324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYVOy-0004zs-AY
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 10:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kYVNV-00044h-D5
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 10:27:41 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:53645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kYVNT-0000i6-CP
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 10:27:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=cOhG/yJR26fm+9wIwiZLsNeA2GqSc2LjIHRMrxTbylo=; b=G77jg865Yd1j74poSpvOKogVuM
 nVNKMDuqH3UsykHISCXQPxkbia3CXIyWzBqAByYaqhQz5UU6CkyOU4zA142FvpbhpUApROQkS2ph/
 447Gy38y8akz9OxYWExZHaAXk+ct4VN2aLgWCKVEqAa1014kKe82caeyfekLkgSNj2+gM860D7G9G
 5fAC7cVM0OIO8i9yQe00HbAWI66gMaqcUz39plJO+zafVU8QJciuS+rGnxfqGA3qtvv22Wsc28q3l
 bujIls79BSfwty5WRBCLOSJAznCJkkkZj4bUfO1hmfaAF9usXzlJsh+/pZu10PMVM5xZ5dsKMv8V3
 QPMtPbkQ==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] tests/9pfs: Force removing of local 9pfs test directory
Date: Fri, 30 Oct 2020 15:27:36 +0100
Message-ID: <3802487.2yqp3XbP3u@silver>
In-Reply-To: <160406199444.312256.8319835906008559151.stgit@bahia.lan>
References: <160406199444.312256.8319835906008559151.stgit@bahia.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 07:59:50
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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

On Freitag, 30. Oktober 2020 13:46:34 CET Greg Kurz wrote:
> No need to get a complaint from "rm" if some path disappeared for some
> reason.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
> 
> I remember seeing a "rm: cannot remove 'some-path': No such file or
> directory" recently but I can't reproduce it with current master :)
> ---
>  tests/qtest/libqos/virtio-9p.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/libqos/virtio-9p.c b/tests/qtest/libqos/virtio-9p.c
> index 6b22fa0e9a49..ab9d88a9b7de 100644
> --- a/tests/qtest/libqos/virtio-9p.c
> +++ b/tests/qtest/libqos/virtio-9p.c
> @@ -62,7 +62,7 @@ static void create_local_test_dir(void)
>  static void remove_local_test_dir(void)
>  {
>      g_assert(local_test_path != NULL);
> -    char *cmd = g_strdup_printf("rm -r '%s'\n", local_test_path);
> +    char *cmd = g_strdup_printf("rm -fr '%s'\n", local_test_path);
>      int res = system(cmd);
>      if (res < 0) {
>          /* ignore error, dummy check to prevent compiler error */

Makes sense, and trivial enough to put it into v2 PR.

Queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

Thanks!

Best regards,
Christian Schoenebeck



