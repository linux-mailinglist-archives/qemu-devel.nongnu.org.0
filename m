Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B40F49F8D3
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 12:56:26 +0100 (CET)
Received: from localhost ([::1]:40490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDPrd-000422-GH
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 06:56:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nDPlV-0003xb-IK
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:50:05 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:46683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nDPlT-00032d-7Z
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:50:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=MbSMZh9pJsd93VnCwrf1H31zyU5vbLRxl3GUehzmO04=; b=U0InfGyE8xU3/PfAgPShD2/fgB
 7hB89BH5fsAS4ohUVp037DwHBwGLRvF2cUzGlpd9ayLq7jR9A3Ege/pxiUxFsgx4F8DnJ1zIv2goT
 74U0eRvRBv2ZAZxPMWBq2eAZmZvC57UB0P3J5JSGeQdlASz2ZO07uRoNKPsk0kBkL74rwfOZU/sbf
 fECy6sCQKdOYyerit4NNQAHFAwH5uZKuREnxOypfHU0Ziaf46xI2EkHbzZc8rBh6FrZ/st/d5rae3
 MPtG23cIMEjJgqajU/tUNk8ueyv6c3zbwVmMSbyV6TOEEJs0HW4h26KYZK/Bdr3GNn7i+MuG9WONu
 gX/2e6nGCEBrK24y/PRJHrtL1Y62yVBL10VF2wkme3QR2Nw/Ap2MV2pulkx/b5zUeBzCGGUMk0d6b
 mD8Gv82aGm2S8XeBYx6/nAIEJp0wZRvCNltZlBd448uPriLxP3JTZb86UFmofAPAUJP7nRxZA7urq
 uq/E6Rj6E7S4zILuhb+0E+CggYvn0F/Q4hBtwWiZ/qRLiojvAe1/6czaftiK0GZ4T4A56QUT5dYvC
 ibzsr5Q4n9lbffP2LRXfIzX2TdvWFqrgvdh5HFn2ji3WluXsjL0SkNbo+/f7nXHPMYy8jLBmaI/gc
 vBkuuLYP2P7hT/QuxPkqu3bjfCNOETbqU+sK9fwZs=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/9pfs: Use g_autofree and g_autoptr where possible
Date: Fri, 28 Jan 2022 12:49:58 +0100
Message-ID: <2336064.2jqZdHoEpY@silver>
In-Reply-To: <20220126171136.672657-1-groug@kaod.org>
References: <20220126171136.672657-1-groug@kaod.org>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mittwoch, 26. Januar 2022 18:11:36 CET Greg Kurz wrote:
> The template pointer in virtio_9p_create_local_test_dir() is leaked.
> Add the g_autofree annotation to fix that. While here, convert the
> rest of the virtio 9p test code to using g_autofree or g_autoptr
> where possible, since this is the preferred approach to avoid potential
> leaks in the future.
> 
> Based-on:
> <f6602123c6f7d0d593466231b04fba087817abbd.1642879848.git.qemu_oss@crudebyte
> .com> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  tests/qtest/libqos/virtio-9p.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)

I fear there is something wrong with this patch:

# Start of local tests
# starting QEMU: exec x86_64-softmmu/qemu-system-x86_64 -qtest unix:/tmp/qtest-4234.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-4234.qmp,id=char0 -mon chardev=char0,mode=control -display none -M pc  -fsdev local,id=fsdev0,path='',security_model=mapped-xattr -device virtio-9p-pci,fsdev=fsdev0,addr=04.0,mount_tag=qtest -accel qtest
qemu-system-x86_64: -device virtio-9p-pci,fsdev=fsdev0,addr=04.0,mount_tag=qtest: cannot initialize fsdev 'fsdev0': failed to open '': No such file or directory
Broken pipe
Aborted

> 
> diff --git a/tests/qtest/libqos/virtio-9p.c b/tests/qtest/libqos/virtio-9p.c
> index ef96ef006adc..0a0d0d16709b 100644
> --- a/tests/qtest/libqos/virtio-9p.c
> +++ b/tests/qtest/libqos/virtio-9p.c
> @@ -40,14 +40,13 @@ static char *concat_path(const char* a, const char* b)
>  void virtio_9p_create_local_test_dir(void)
>  {
>      struct stat st;
> -    char *pwd = g_get_current_dir();
> -    char *template = concat_path(pwd, "qtest-9p-local-XXXXXX");
> +    g_autofree char *pwd = g_get_current_dir();
> +    g_autofree char *template = concat_path(pwd, "qtest-9p-local-XXXXXX");
> 
>      local_test_path = mkdtemp(template);
>      if (!local_test_path) {
>          g_test_message("mkdtemp('%s') failed: %s", template,
> strerror(errno)); }
> -    g_free(pwd);
> 
>      g_assert(local_test_path != NULL);
> 
> @@ -60,12 +59,11 @@ void virtio_9p_create_local_test_dir(void)
>  void virtio_9p_remove_local_test_dir(void)
>  {
>      g_assert(local_test_path != NULL);
> -    char *cmd = g_strdup_printf("rm -fr '%s'\n", local_test_path);
> +    g_autofree char *cmd = g_strdup_printf("rm -fr '%s'\n",
> local_test_path); int res = system(cmd);
>      if (res < 0) {
>          /* ignore error, dummy check to prevent compiler error */
>      }
> -    g_free(cmd);
>  }
> 
>  char *virtio_9p_test_path(const char *path)
> @@ -209,8 +207,8 @@ static void *virtio_9p_pci_create(void *pci_bus,
> QGuestAllocator *t_alloc, static void regex_replace(GString *haystack,
> const char *pattern, const char *replace_fmt, ...)
>  {
> -    GRegex *regex;
> -    char *replace, *s;
> +    g_autoptr(GRegex) regex = NULL;
> +    g_autofree char *replace = NULL, *s = NULL;
>      va_list argp;
> 
>      va_start(argp, replace_fmt);
> @@ -220,9 +218,6 @@ static void regex_replace(GString *haystack, const char
> *pattern, regex = g_regex_new(pattern, 0, 0, NULL);
>      s = g_regex_replace(regex, haystack->str, -1, 0, replace, 0, NULL);
>      g_string_assign(haystack, s);
> -    g_free(s);
> -    g_regex_unref(regex);
> -    g_free(replace);
>  }
> 
>  void virtio_9p_assign_local_driver(GString *cmd_line, const char *args)



