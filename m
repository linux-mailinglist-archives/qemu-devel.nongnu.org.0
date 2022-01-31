Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBBA4A4D7D
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 18:47:40 +0100 (CET)
Received: from localhost ([::1]:53476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEamB-0002fj-4H
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 12:47:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nEaiE-0000bU-NG
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 12:43:34 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:39767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nEaiC-0004zM-Ao
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 12:43:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=zhne9GLx/qk2HzVhphz07xhaFGHD6vEvV0tgeFDnSlQ=; b=p5/v9fu/XeoQi6xLmSpken3igu
 rWjsxRB/ExRvqY7/veI9jMqVEdcT9piaJvbDxWqa/wlk01vBwrnvvWyvUPPh2CbsOh9eBJanW0wKA
 v8ewVzb29I6Ij5XQy9HCFDnQIVgNUTLVpuLpuaNndCJWuo0nsaQX/2UcnkWFCYk//8weDdr6SEn8F
 pEAZlVv0Phdp/aAsHcxVfhacRzVmFGoWKnohiwP9FxQpyJwCTFm55Povu6B3fPufJ3ZGgYn5dqzf0
 gxtOXs43kgRa2MKG+0pHuNF0zwnSQHJTcjiJNDbeGCMniE4yn4yrWmrDOA2yUbpzAiqclc9EMraBL
 2XHpmeeAAkhYpLbYx69YIlSWsK5qQwnilWWNBCN7f0gSfsQcc5NczpnoHXS39IL7r0CrWsYHCxxHS
 eZs9xWW0itDWAjH06VQblTya1pnn3UWXtW9BJPT8bYYMm5ptUbIvm/0J9FO/D0W0C2CGKzlUM1Qk+
 Pb0HFddmu7X3KaFaJMA2lzS6v+34p/QHxZh+wK2MGnkbpugX2FAva9RFLXv2fyvYIJiKdVb762CUo
 QT6+efW2fMrEX2Qx2mYNFyl9wp6Up2Uix8/GrFw4ppdvf9hVEHRrG3w1Kd7oNm1+kSeVP7kQT1yZK
 5sAr1wSkX4bLWZbLbpth3tH0UMz74ZjZm4lHXsWmk=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] tests/9pfs: Use g_autofree and g_autoptr where possible
Date: Mon, 31 Jan 2022 18:43:22 +0100
Message-ID: <2201667.JLq2WqQvVQ@silver>
In-Reply-To: <20220131163930.61521-1-groug@kaod.org>
References: <20220131163930.61521-1-groug@kaod.org>
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

On Montag, 31. Januar 2022 17:39:30 CET Greg Kurz wrote:
> It is recommended to use g_autofree or g_autoptr as it reduces
> the odds of introducing memory leaks in future changes. Let's do
> that everywhere a glib allocation is performed.
> 
> The virtio_9p_create_local_test_dir() function needs some extra
> care though : the template pointer is eventually cached into the
> local_test_path global variable for the duration of the tests and
> should not be freed. Add the g_autofree annotation but negate it
> with g_steal_pointer() to make it clear that the pointer ownership
> is dropped on purpose.
> 
> Based-on:
> <f6602123c6f7d0d593466231b04fba087817abbd.1642879848.git.qemu_oss@crudebyte
> .com> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
> v2: - fix crash with local_test_path
> ---
>  tests/qtest/libqos/virtio-9p.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/tests/qtest/libqos/virtio-9p.c b/tests/qtest/libqos/virtio-9p.c
> index ef96ef006adc..f0ffbc583492 100644
> --- a/tests/qtest/libqos/virtio-9p.c
> +++ b/tests/qtest/libqos/virtio-9p.c
> @@ -37,18 +37,22 @@ static char *concat_path(const char* a, const char* b)
>      return g_build_filename(a, b, NULL);
>  }
> 
> -void virtio_9p_create_local_test_dir(void)
> +static char *make_temp_dir(char *template)
>  {
> -    struct stat st;
> -    char *pwd = g_get_current_dir();
> -    char *template = concat_path(pwd, "qtest-9p-local-XXXXXX");
> -
> -    local_test_path = mkdtemp(template);
> -    if (!local_test_path) {
> +    char *path = mkdtemp(template);
> +    if (!path) {
>          g_test_message("mkdtemp('%s') failed: %s", template,
> strerror(errno)); }
> -    g_free(pwd);
> +    return path;
> +}
> +
> +void virtio_9p_create_local_test_dir(void)
> +{
> +    g_autofree char *pwd = g_get_current_dir();
> +    g_autofree char *template = concat_path(pwd, "qtest-9p-local-XXXXXX");
> +    struct stat st;
> 
> +    local_test_path = make_temp_dir(g_steal_pointer(&template));

Quite noisy diff and under the bottom line, it does not fix what it originally 
supposed to: addressing the leak of the global variable 'local_test_path'. 
g_steal_pointer() simply makes the previous g_autofree prefix pointless.

Why not just moving g_autofree from 'template' to the global variable 
'local_test_path' and avoid all that noise? 

>      g_assert(local_test_path != NULL);
> 
>      /* ensure test directory exists now ... */
> @@ -60,12 +64,11 @@ void virtio_9p_create_local_test_dir(void)
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
> @@ -209,8 +212,8 @@ static void *virtio_9p_pci_create(void *pci_bus,
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
> @@ -220,9 +223,6 @@ static void regex_replace(GString *haystack, const char
> *pattern, regex = g_regex_new(pattern, 0, 0, NULL);
>      s = g_regex_replace(regex, haystack->str, -1, 0, replace, 0, NULL);
>      g_string_assign(haystack, s);
> -    g_free(s);
> -    g_regex_unref(regex);
> -    g_free(replace);
>  }
> 
>  void virtio_9p_assign_local_driver(GString *cmd_line, const char *args)



