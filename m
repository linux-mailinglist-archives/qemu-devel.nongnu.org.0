Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEB8281513
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 16:28:31 +0200 (CEST)
Received: from localhost ([::1]:54354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOM2w-0004rX-4c
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 10:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kOM1R-0004BB-Pz
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 10:26:57 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:33489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kOM1M-0002Xt-2i
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 10:26:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=kLZ7bBEY4DCsYsby5HxM8vGhnPpthYs7R7wkq0VoHHU=; b=b3ZChwEgyAV/V0Td5uQFBJSv1x
 Tzq23rslhuA6VySu0IH3z4+HntR+Se6iLYRG2O6swmyFwWLQ648rVkpzzJ0529e1eSoOnXDCy5ge2
 34AFMn522RrkgMDuf83oDf22DNxGUyLKWeRwvefXMPmuukA+gMADQ0cbGEPRXluRhasBOpF7gERFN
 Z+gbJCIzu8z4+Ci9O+VxKO2O1vcLYMPZQID/QsMHkoUDYAhE5GsunVVnPvt6donVgXCZ893mXglDm
 994Q2pwCYicrCG9e1tYXY1UGGxoGN9wKDQTgNOfCJJaHk5fYFlpamZ1+LksbV6pJEEY/x0PKt0YC8
 lK1kdObQ==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 Greg Kurz <groug@kaod.org>,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 08/11] tests/9pfs: introduce local tests
Date: Fri, 02 Oct 2020 16:26:48 +0200
Message-ID: <27148257.gUaGpDsOI2@silver>
In-Reply-To: <8dd7d15176ca1e947054dd6891e478cdf7902f7e.1601639563.git.qemu_oss@crudebyte.com>
References: <cover.1601639563.git.qemu_oss@crudebyte.com>
 <8dd7d15176ca1e947054dd6891e478cdf7902f7e.1601639563.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 08:18:24
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

On Freitag, 2. Oktober 2020 13:51:54 CEST Christian Schoenebeck wrote:
> This patch introduces 9pfs test cases using the 9pfs 'local'
> filesystem driver which reads/writes/creates/deletes real files
> and directories.
> 
> In this initial version, there is only one local test which actually
> only checks if the 9pfs 'local' device was created successfully.
> 
> Before the 9pfs 'local' tests are run, a test directory 'qtest-9p-local'
> is created (with world rwx permissions) under the current working
> directory. At this point that test directory is not auto deleted yet.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  tests/qtest/libqos/virtio-9p.c | 100 +++++++++++++++++++++++++++++++++
>  tests/qtest/libqos/virtio-9p.h |   5 ++
>  tests/qtest/virtio-9p-test.c   |  44 ++++++++++-----
>  3 files changed, 135 insertions(+), 14 deletions(-)
> 
> diff --git a/tests/qtest/libqos/virtio-9p.c b/tests/qtest/libqos/virtio-9p.c
> index 2e300063e3..86e40e5d56 100644
> --- a/tests/qtest/libqos/virtio-9p.c
> +++ b/tests/qtest/libqos/virtio-9p.c
> @@ -24,6 +24,63 @@
>  #include "qgraph.h"
> 
>  static QGuestAllocator *alloc;
> +static char *local_test_path;
> +
> +static char *strpr(const char* format, ...) GCC_FMT_ATTR(1, 2);
> +
> +/* Concatenates the passed 2 pathes. Returned result must be freed. */
> +static char *concat_path(const char* a, const char* b)
> +{
> +    const int len = strlen(a) + strlen("/") + strlen(b);
> +    char *path = g_malloc0(len + 1);
> +    snprintf(path, len + 1, "%s/%s", a, b);
> +    g_assert(strlen(path) == len);
> +    return path;
> +}

Ok, but maybe I could make that concat_path() function wrap g_strconcat().

> +
> +/*
> + * Lazy sprintf() implementation which auto allocates buffer. Returned
> result + * must be freed.
> + */
> +static char *strpr(const char* format, ...)
> +{
> +    va_list argp;
> +
> +    va_start(argp, format);
> +    const int sz = vsnprintf(NULL, 0, format, argp) + 1;
> +    va_end(argp);
> +
> +    g_assert(sz > 0);
> +    char *s = g_malloc0(sz);
> +
> +    va_start(argp, format);
> +    const int len = vsnprintf(s, sz, format, argp);
> +    va_end(argp);
> +
> +    g_assert(len + 1 == sz);
> +    return s;
> +}

And this strpr() function entirely be replaced by g_strdup_printf().

> +
> +static void init_local_test_path(void)
> +{
> +    char *pwd = get_current_dir_name();
> +    local_test_path = concat_path(pwd, "qtest-9p-local");
> +    free(pwd);
> +}
> +
> +/* Creates the directory for the 9pfs 'local' filesystem driver to access.
> */ +static void create_local_test_dir(void)
> +{
> +    struct stat st;
> +
> +    g_assert(local_test_path != NULL);
> +    mkdir(local_test_path, 0777);
> +
> +    /* ensure test directory exists now ... */
> +    g_assert(stat(local_test_path, &st) == 0);
> +    /* ... and is actually a directory */
> +    g_assert((st.st_mode & S_IFMT) == S_IFDIR);
> +}
> 
>  static void virtio_9p_cleanup(QVirtio9P *interface)
>  {
> @@ -146,11 +203,54 @@ static void *virtio_9p_pci_create(void *pci_bus,
> QGuestAllocator *t_alloc, return obj;
>  }
> 
> +void virtio_9p_assign_local_driver(GString *cmd_line, const char *args)
> +{
> +    GRegex *regex;
> +    char *s, *arg_repl;
> +
> +    g_assert_nonnull(local_test_path);
> +
> +    /* replace 'synth' driver by 'local' driver */
> +    regex = g_regex_new("-fsdev synth,", 0, 0, NULL);
> +    s = g_regex_replace_literal(
> +        regex, cmd_line->str, -1, 0, "-fsdev local,", 0, NULL
> +    );
> +    g_string_assign(cmd_line, s);
> +    g_free(s);
> +    g_regex_unref(regex);
> +
> +    /* add 'path=...' to '-fsdev ...' group */
> +    regex = g_regex_new("(-fsdev \\w+)(\\s*)", 0, 0, NULL);
> +    arg_repl = strpr("\\1\\2,path='%s'", local_test_path);
> +    s = g_regex_replace(
> +        regex, cmd_line->str, -1, 0, arg_repl, 0, NULL
> +    );
> +    g_string_assign(cmd_line, s);
> +    g_free(arg_repl);
> +    g_free(s);
> +    g_regex_unref(regex);
> +
> +    /* add passed args to '-fsdev ...' group */
> +    regex = g_regex_new("(-fsdev \\w+)(\\s*)", 0, 0, NULL);
> +    arg_repl = strpr("\\1\\2,%s", args);
> +    s = g_regex_replace(
> +        regex, cmd_line->str, -1, 0, arg_repl, 0, NULL
> +    );
> +    g_string_assign(cmd_line, s);
> +    g_free(arg_repl);
> +    g_free(s);
> +    g_regex_unref(regex);
> +}
> +
>  static void virtio_9p_register_nodes(void)
>  {
>      const char *str_simple = "fsdev=fsdev0,mount_tag=" MOUNT_TAG;
>      const char *str_addr = "fsdev=fsdev0,addr=04.0,mount_tag=" MOUNT_TAG;
> 
> +    /* make sure test dir for the 'local' tests exists and is clean */
> +    init_local_test_path();
> +    create_local_test_dir();
> +
>      QPCIAddress addr = {
>          .devfn = QPCI_DEVFN(4, 0),
>      };
> diff --git a/tests/qtest/libqos/virtio-9p.h b/tests/qtest/libqos/virtio-9p.h
> index b1e6badc4a..326a603f72 100644
> --- a/tests/qtest/libqos/virtio-9p.h
> +++ b/tests/qtest/libqos/virtio-9p.h
> @@ -44,4 +44,9 @@ struct QVirtio9PDevice {
>      QVirtio9P v9p;
>  };
> 
> +/**
> + * Prepares QEMU command line for 9pfs tests using the 'local' fs driver.
> + */
> +void virtio_9p_assign_local_driver(GString *cmd_line, const char *args);
> +
>  #endif
> diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> index 3281153b9c..af7e169d3a 100644
> --- a/tests/qtest/virtio-9p-test.c
> +++ b/tests/qtest/virtio-9p-test.c
> @@ -895,29 +895,45 @@ static void fs_readdir_split_512(void *obj, void
> *data, fs_readdir_split(obj, data, t_alloc, 512);
>  }
> 
> +static void *assign_9p_local_driver(GString *cmd_line, void *arg)
> +{
> +    virtio_9p_assign_local_driver(cmd_line, "security_model=mapped-xattr");
> +    return arg;
> +}
> +
>  static void register_virtio_9p_test(void)
>  {
> -    qos_add_test("synth/config", "virtio-9p", pci_config, NULL);
> -    qos_add_test("synth/version/basic", "virtio-9p", fs_version, NULL);
> -    qos_add_test("synth/attach/basic", "virtio-9p", fs_attach, NULL);
> -    qos_add_test("synth/walk/basic", "virtio-9p", fs_walk, NULL);
> +
> +    QOSGraphTestOptions opts = {
> +    };
> +
> +    /* 9pfs test cases using the 'synth' filesystem driver */
> +    qos_add_test("synth/config", "virtio-9p", pci_config, &opts);
> +    qos_add_test("synth/version/basic", "virtio-9p", fs_version,  &opts);
> +    qos_add_test("synth/attach/basic", "virtio-9p", fs_attach,  &opts);
> +    qos_add_test("synth/walk/basic", "virtio-9p", fs_walk,  &opts);
>      qos_add_test("synth/walk/no_slash", "virtio-9p", fs_walk_no_slash,
> -                 NULL);
> +                  &opts);
>      qos_add_test("synth/walk/dotdot_from_root", "virtio-9p",
> -                 fs_walk_dotdot, NULL);
> -    qos_add_test("synth/lopen/basic", "virtio-9p", fs_lopen, NULL);
> -    qos_add_test("synth/write/basic", "virtio-9p", fs_write, NULL);
> +                 fs_walk_dotdot,  &opts);
> +    qos_add_test("synth/lopen/basic", "virtio-9p", fs_lopen,  &opts);
> +    qos_add_test("synth/write/basic", "virtio-9p", fs_write,  &opts);
>      qos_add_test("synth/flush/success", "virtio-9p", fs_flush_success,
> -                 NULL);
> +                  &opts);
>      qos_add_test("synth/flush/ignored", "virtio-9p", fs_flush_ignored,
> -                 NULL);
> -    qos_add_test("synth/readdir/basic", "virtio-9p", fs_readdir, NULL);
> +                  &opts);
> +    qos_add_test("synth/readdir/basic", "virtio-9p", fs_readdir,  &opts);
>      qos_add_test("synth/readdir/split_512", "virtio-9p",
> -                 fs_readdir_split_512, NULL);
> +                 fs_readdir_split_512,  &opts);
>      qos_add_test("synth/readdir/split_256", "virtio-9p",
> -                 fs_readdir_split_256, NULL);
> +                 fs_readdir_split_256,  &opts);
>      qos_add_test("synth/readdir/split_128", "virtio-9p",
> -                 fs_readdir_split_128, NULL);
> +                 fs_readdir_split_128,  &opts);
> +
> +
> +    /* 9pfs test cases using the 'local' filesystem driver */
> +    opts.before = assign_9p_local_driver;
> +    qos_add_test("local/config", "virtio-9p", pci_config,  &opts);
>  }
> 
>  libqos_init(register_virtio_9p_test);

Best regards,
Christian Schoenebeck



