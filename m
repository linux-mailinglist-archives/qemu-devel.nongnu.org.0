Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFAB64C732
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 11:34:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Oi7-0007hb-2m; Wed, 14 Dec 2022 05:09:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Ohu-0007cN-1e
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Ohr-00019o-37
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671012575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lYt2R1VOK0G324xErJUQZPSyqa5qqXsL3KSkSH7mha0=;
 b=Tm5shxxqD5beZtBG+g45DR+ZAgruGtEGxn0tPn4CBLqwL52Y4h8fYfOFFyS2IgzmIOVYff
 noGx8aq4rWIpyFU4FovveTerLXzGgLrDqyjIX2tkhmq2NUThVJb56FFue35iEzlJIiCXpH
 X078GCoh3hL4PrIoP6opB/jJbajzMwg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-_3oUW21JNtWZXuGROAJPug-1; Wed, 14 Dec 2022 05:09:31 -0500
X-MC-Unique: _3oUW21JNtWZXuGROAJPug-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28EE63C0252B;
 Wed, 14 Dec 2022 10:09:31 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63920492C14;
 Wed, 14 Dec 2022 10:09:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 10/23] util/oslib-win32: Remove obsolete reference to g_poll
 code
Date: Wed, 14 Dec 2022 11:08:58 +0100
Message-Id: <20221214100911.165291-11-thuth@redhat.com>
In-Reply-To: <20221214100911.165291-1-thuth@redhat.com>
References: <20221214100911.165291-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The comment about g_poll is not required here anymore since
the corresponding code has been removed a while ago already.

Fixes: b4c6036faa ("configure: bump min required glib version to 2.56")
Message-Id: <20221208133257.95673-1-thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 util/oslib-win32.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index a67cb3822e..07ade41800 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -24,10 +24,6 @@
  * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  * THE SOFTWARE.
- *
- * The implementation of g_poll (functions poll_rest, g_poll) at the end of
- * this file are based on code from GNOME glib-2 and use a different license,
- * see the license comment there.
  */
 
 #include "qemu/osdep.h"
-- 
2.31.1


