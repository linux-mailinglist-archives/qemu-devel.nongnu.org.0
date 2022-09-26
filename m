Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FCC5EA65A
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 14:42:12 +0200 (CEST)
Received: from localhost ([::1]:56888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocnR5-0003wH-TF
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 08:42:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ocnMi-0000BM-3r
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 08:37:40 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:40779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ocnMf-0004ZV-7y
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 08:37:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=ujj5M1+6M5ltQmw8CrJwofmooqG8Vb246/JC7RB1Qk0=; b=U+9pFUyzdQJ2ytk3GJXy2vURXL
 1rPD1EriNSvg/zdTd1udvn0QhdmIlK5UMmtOUfj+voUeaeKUhEvMoBDTpRTHm3f+s7QagfwoFJAbc
 Rs42ny+QtsQReLz8Zg+hS21KNHDlQDRhG1saU2jdylEbH62h91Xdq2SPB83jbVEThU2quQVM+HBM8
 vV7vVaYLGItkS4gUhjQjoKxBS8aPhlyuxnxi4JfKizhf7UxK4y3qppVrRzx5BTBfsz+DeoK8V2sSA
 lzDO2lkuTcQs7bDQTxQXdlHq0mi8t8kKEuLhWSE3xmETl1sz+BkSBw9waMuXiNopgxhVw8QpTpkjT
 i6nliZhjBATOn2WA9hE4mPAYolv8On3vcsKBPPBJtlVnN596iTMOoF3c0S9KRqz8jpW6yJvvW0swk
 ULbg3CbIzhGf02oXz987fXC93KA3IM68e2TFjc0ks4REkk22Dfg6qIQuSI4qJaQiBhApqHgr+iesH
 vTWcvQ6kxiEJyk9A/HjA6+Q2bmtJIJVDWNjS7lSZjq+GYrhL7VXMtpHuLkeCvtttJXK0jtcdwMhWM
 rmroCFpggYO67g57htmM+ootRMwd39C5TbusS36yIH+Jyqhbx5/LV+urKN7tLIM1B8p+VH9jTi1Gs
 TAyqHsCWzwe9Q3y4pZbUtmxJQNsmW6Srbh//KKPeI=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] tests/9p: split virtio-9p-test.c into tests and 9p client
 part
Date: Mon, 26 Sep 2022 14:36:56 +0200
Message-ID: <1886216.9IVtKRJSP6@silver>
In-Reply-To: <E1oX4nS-0001UM-Cz@lizzy.crudebyte.com>
References: <E1oX4nS-0001UM-Cz@lizzy.crudebyte.com>
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
X-Mailman-Version: 2.1.29
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

On Samstag, 10. September 2022 19:46:55 CEST Christian Schoenebeck wrote:
> This patch is pure refactoring, it does not change behaviour.
> 
> virtio-9p-test.c grew to 1657 lines. Let's split this file up between
> actual 9p test cases vs. 9p test client, to make it easier to
> concentrate on the actual 9p tests.
> 
> Move the 9p test client code to a new unit virtio-9p-client.c, which
> are basically all functions and types prefixed with v9fs_* already.
> 
> Note that some client wrapper functions (do_*) are preserved in
> virtio-9p-test.c, simply because these wrapper functions are going to
> be wiped with subsequent patches anyway.
> 
> As the global QGuestAllocator variable is moved to virtio-9p-client.c,
> add a new function v9fs_set_allocator() to be used by virtio-9p-test.c
> instead of fiddling with a global variable across units and libraries.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---

I plan to queue this patch this week, if not hearing something back.

It's the same code and behaviour anyway, just splitted to a seprate file.

> As I am working on extending the previously sent RFC [1] (which will be
> using function calls with named function arguments), I realized that it
> makes sense to first split the client code out to a new file, and then
> make the upcoming patches based on this patch here. Because that way
> I don't have to touch the order of the client functions and the upcoming
> patches will therefore become better readable.
> 
> [1] https://lore.kernel.org/all/E1oDQqv-0003d4-Hm@lizzy.crudebyte.com/
> 
>  tests/qtest/libqos/meson.build        |   1 +
>  tests/qtest/libqos/virtio-9p-client.c | 683 +++++++++++++++++++++++
>  tests/qtest/libqos/virtio-9p-client.h | 139 +++++
>  tests/qtest/virtio-9p-test.c          | 770 +-------------------------
>  4 files changed, 849 insertions(+), 744 deletions(-)
>  create mode 100644 tests/qtest/libqos/virtio-9p-client.c
>  create mode 100644 tests/qtest/libqos/virtio-9p-client.h



