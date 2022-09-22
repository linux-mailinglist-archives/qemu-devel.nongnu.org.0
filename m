Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4285E6C22
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 21:53:44 +0200 (CEST)
Received: from localhost ([::1]:45392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obSGU-0001nr-Va
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 15:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obSAB-0003mD-R6; Thu, 22 Sep 2022 15:47:12 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:46774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obSA1-000164-Q1; Thu, 22 Sep 2022 15:47:11 -0400
Received: by mail-lj1-x229.google.com with SMTP id p5so12196768ljc.13;
 Thu, 22 Sep 2022 12:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=qfIusdTRSxKuM5Yi1p5ySxd2Ljc2sJhfSgWm97UkWpA=;
 b=S9MicyFi8xnDOd93A7IWKEzGEDuSu7Vt/CJW6PJ3xSoMHQCSUQiKcGWQB1mXaEJQH/
 IYhnnt1Z5bbcoQuYSYYAcV23RbKFHXVyPXxMSKARqihxdH+57iZ4AlqKcWFhMMKylGkX
 FDe5RTWSbn8v0YeBdQz1xzTa7eFLT0pDKeRrgtjqyrcNZXAQLXcYZtGn4tK0pOGZ7prA
 fliK4CJ5PeJ4uu27FtdESXpO7qt9h6S5ImTCNwZF+i9Xt8BqDsCd3qfydjP+DciqyVYv
 /TKtpRRRK1s2yDsjDDhPlZk6gtsoaaoHLrg49cxsDxmv7x/ab2svL0gKctm7mJHgRq2i
 D4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=qfIusdTRSxKuM5Yi1p5ySxd2Ljc2sJhfSgWm97UkWpA=;
 b=5lksEK8M6UN3KB8VnEmO/cOyA0C02LXIiJQVtP3uyr22ikH7xDYFG+QJXgP8PNMXfU
 ebsZNUOeCRlLQuyQfa8Ic2ek94YJCvQdCNUg1trSLFf9A9fb/n4sciuajTwbQMfwjAop
 P5wfO4AKBuBotwvW+wQPyzfa7FbNRTcqcqhx6/kppKDOAaDtFad+q/56c4sowJFHX4at
 b3PyILEdmSSt0nMUBHRVEtWtez8bJpb8HHyKTU1WGbWvCcf7pPxoaLljSF/uEtcLASq/
 v5sqMg2tedBYqgBORFMcU+FejvDQIpJvTgihvuMN+tGbewQjImhAWo1frmBsgHesGtye
 uNaQ==
X-Gm-Message-State: ACrzQf1MVSJ2HexPvDNtMrRXnOkExT6h76zMAcmNLMbVkC7GXDJ88wmX
 PfDESHFwbxcV+k55msMXq/u23r+eRv52tTAgtEU=
X-Google-Smtp-Source: AMsMyM5kJaAERxcpjGlGD5fnS9AypOYxUbqi0qAgDORSqmUhdqRlDepNC1x9hShfjl9sSDaFa5Vs24sswEE/DonW3P4=
X-Received: by 2002:a2e:a58a:0:b0:26c:6dce:ce4e with SMTP id
 m10-20020a2ea58a000000b0026c6dcece4emr1755272ljp.452.1663876016349; Thu, 22
 Sep 2022 12:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-8-bmeng.cn@gmail.com>
In-Reply-To: <20220920103159.1865256-8-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 22 Sep 2022 21:46:44 +0200
Message-ID: <CAJ+F1CKUOd=fLO9f_vVGOajcgi9+XSrbNjPUX+H5hhrxGMCU2g@mail.gmail.com>
Subject: Re: [PATCH v2 07/39] tests: Avoid using hardcoded /tmp in test cases
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Alexander Bulekov <alxndr@bu.edu>, Andrew Jeffery <andrew@aj.id.au>,
 Bandan Das <bsd@redhat.com>, 
 Coiby Xu <Coiby.Xu@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Darren Kenny <darren.kenny@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Fam Zheng <fam@euphon.net>, Joel Stanley <joel@jms.id.au>,
 John Snow <jsnow@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, Konstantin Kostiuk <kkostiuk@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Qiuhao Li <Qiuhao.Li@outlook.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000e7a73405e94952d9"
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000e7a73405e94952d9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Sep 20, 2022 at 2:47 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> Lots of test cases were written to use hardcoded /tmp directory for
> temporary files. To avoid this, we update them to use g_dir_make_tmp()
> or g_file_open_tmp() when appropriate.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> Changes in v2:
> - Use g_dir_make_tmp(), g_file_open_tmp() when appropriate
>
>  tests/qtest/fuzz/generic_fuzz_configs.h |  4 ++--
>  tests/qtest/ahci-test.c                 | 19 +++++++++++--------
>  tests/qtest/aspeed_smc-test.c           |  5 ++---
>  tests/qtest/boot-serial-test.c          |  9 +++++----
>  tests/qtest/cxl-test.c                  | 15 ++++++---------
>  tests/qtest/fdc-test.c                  |  5 +++--
>  tests/qtest/fuzz/virtio_blk_fuzz.c      |  4 ++--
>  tests/qtest/hd-geo-test.c               | 24 +++++++++++-------------
>  tests/qtest/ide-test.c                  | 10 ++++++----
>  tests/qtest/libqtest.c                  | 12 ++++++++----
>  tests/qtest/migration-test.c            |  7 ++++---
>  tests/qtest/pflash-cfi02-test.c         |  8 +++++---
>  tests/qtest/qmp-test.c                  |  6 ++++--
>  tests/qtest/vhost-user-blk-test.c       |  3 ++-
>  tests/qtest/vhost-user-test.c           |  8 ++++----
>  tests/qtest/virtio-blk-test.c           |  4 ++--
>  tests/qtest/virtio-scsi-test.c          |  4 ++--
>  tests/unit/test-image-locking.c         |  8 ++++----
>  tests/unit/test-qga.c                   |  2 +-
>  tests/vhost-user-bridge.c               |  3 +--
>  20 files changed, 85 insertions(+), 75 deletions(-)
>
> diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h
> b/tests/qtest/fuzz/generic_fuzz_configs.h
> index 0775e6702b..a825b78c14 100644
> --- a/tests/qtest/fuzz/generic_fuzz_configs.h
> +++ b/tests/qtest/fuzz/generic_fuzz_configs.h
> @@ -20,8 +20,8 @@ typedef struct generic_fuzz_config {
>  } generic_fuzz_config;
>
>  static inline gchar *generic_fuzzer_virtio_9p_args(void){
> -    char tmpdir[] =3D "/tmp/qemu-fuzz.XXXXXX";
> -    g_assert_nonnull(g_mkdtemp(tmpdir));
> +    g_autofree char *tmpdir =3D g_dir_make_tmp("qemu-fuzz.XXXXXX", NULL)=
;
> +    g_assert_nonnull(tmpdir);
>
>      return g_strdup_printf("-machine q35 -nodefaults "
>      "-device virtio-9p,fsdev=3Dhshare,mount_tag=3Dhshare "
> diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
> index f1e510b0ac..00524f14c6 100644
> --- a/tests/qtest/ahci-test.c
> +++ b/tests/qtest/ahci-test.c
> @@ -44,9 +44,9 @@
>  #define TEST_IMAGE_SIZE_MB_SMALL 64
>
>  /*** Globals ***/
> -static char tmp_path[] =3D "/tmp/qtest.XXXXXX";
> -static char debug_path[] =3D "/tmp/qtest-blkdebug.XXXXXX";
> -static char mig_socket[] =3D "/tmp/qtest-migration.XXXXXX";
> +static char *tmp_path;
> +static char *debug_path;
> +static char *mig_socket;
>  static bool ahci_pedantic;
>  static const char *imgfmt;
>  static unsigned test_image_size_mb;
> @@ -1437,10 +1437,10 @@ static void test_ncq_simple(void)
>
>  static int prepare_iso(size_t size, unsigned char **buf, char **name)
>  {
> -    char cdrom_path[] =3D "/tmp/qtest.iso.XXXXXX";
> +    g_autofree char *cdrom_path;
>

Whenever introducing g_auto* usage, please make sure to initialize the
variable to NULL or a correct value.

     unsigned char *patt;
>      ssize_t ret;
> -    int fd =3D mkstemp(cdrom_path);
> +    int fd =3D g_file_open_tmp("qtest.iso.XXXXXX", &cdrom_path, NULL);
>
>      g_assert(fd !=3D -1);
>      g_assert(buf);
> @@ -1872,7 +1872,7 @@ int main(int argc, char **argv)
>      }
>
>      /* Create a temporary image */
> -    fd =3D mkstemp(tmp_path);
> +    fd =3D g_file_open_tmp("qtest.XXXXXX", &tmp_path, NULL);
>      g_assert(fd >=3D 0);
>      if (have_qemu_img()) {
>          imgfmt =3D "qcow2";
> @@ -1889,12 +1889,12 @@ int main(int argc, char **argv)
>      close(fd);
>
>      /* Create temporary blkdebug instructions */
> -    fd =3D mkstemp(debug_path);
> +    fd =3D g_file_open_tmp("qtest-blkdebug.XXXXXX", &debug_path, NULL);
>      g_assert(fd >=3D 0);
>      close(fd);
>
>      /* Reserve a hollow file to use as a socket for migration tests */
> -    fd =3D mkstemp(mig_socket);
> +    fd =3D g_file_open_tmp("qtest-migration.XXXXXX", &mig_socket, NULL);
>      g_assert(fd >=3D 0);
>      close(fd);
>
> @@ -1947,8 +1947,11 @@ int main(int argc, char **argv)
>
>      /* Cleanup */
>      unlink(tmp_path);
> +    g_free(tmp_path);
>      unlink(debug_path);
> +    g_free(debug_path);
>      unlink(mig_socket);
> +    g_free(mig_socket);
>
>      return ret;
>  }
> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.=
c
> index 05ce941566..5e16b5c9a5 100644
> --- a/tests/qtest/aspeed_smc-test.c
> +++ b/tests/qtest/aspeed_smc-test.c
> @@ -608,16 +608,15 @@ static void test_write_block_protect_bottom_bit(voi=
d)
>      flash_reset();
>  }
>
> -static char tmp_path[] =3D "/tmp/qtest.m25p80.XXXXXX";
> -
>  int main(int argc, char **argv)
>  {
> +    g_autofree char *tmp_path;
>      int ret;
>      int fd;
>
>      g_test_init(&argc, &argv, NULL);
>
> -    fd =3D mkstemp(tmp_path);
> +    fd =3D g_file_open_tmp("qtest.m25p80.XXXXXX", &tmp_path, NULL);
>      g_assert(fd >=3D 0);
>      ret =3D ftruncate(fd, FLASH_SIZE);
>      g_assert(ret =3D=3D 0);
> diff --git a/tests/qtest/boot-serial-test.c
> b/tests/qtest/boot-serial-test.c
> index 2f99d71cab..ce6e3d3eb8 100644
> --- a/tests/qtest/boot-serial-test.c
> +++ b/tests/qtest/boot-serial-test.c
> @@ -224,14 +224,14 @@ static bool check_guest_output(QTestState *qts,
> const testdef_t *test, int fd)
>  static void test_machine(const void *data)
>  {
>      const testdef_t *test =3D data;
> -    char serialtmp[] =3D "/tmp/qtest-boot-serial-sXXXXXX";
> -    char codetmp[] =3D "/tmp/qtest-boot-serial-cXXXXXX";
> +    g_autofree char *serialtmp;
> +    char *codetmp;
>      const char *codeparam =3D "";
>      const uint8_t *code =3D NULL;
>      QTestState *qts;
>      int ser_fd;
>
> -    ser_fd =3D mkstemp(serialtmp);
> +    ser_fd =3D g_file_open_tmp("qtest-boot-serial-sXXXXXX", &serialtmp,
> NULL);
>      g_assert(ser_fd !=3D -1);
>
>      if (test->kernel) {
> @@ -246,7 +246,7 @@ static void test_machine(const void *data)
>          ssize_t wlen;
>          int code_fd;
>
> -        code_fd =3D mkstemp(codetmp);
> +        code_fd =3D g_file_open_tmp("qtest-boot-serial-cXXXXXX", &codetm=
p,
> NULL);
>          g_assert(code_fd !=3D -1);
>          wlen =3D write(code_fd, code, test->codesize);
>          g_assert(wlen =3D=3D test->codesize);
> @@ -264,6 +264,7 @@ static void test_machine(const void *data)
>                        serialtmp, test->extra);
>      if (code) {
>          unlink(codetmp);
> +        g_free(codetmp);
>      }
>
>      if (!check_guest_output(qts, test, ser_fd)) {
> diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
> index 2e14da7dee..4f3ea76fa3 100644
> --- a/tests/qtest/cxl-test.c
> +++ b/tests/qtest/cxl-test.c
> @@ -93,10 +93,9 @@ static void cxl_2root_port(void)
>  static void cxl_t3d(void)
>  {
>      g_autoptr(GString) cmdline =3D g_string_new(NULL);
> -    char template[] =3D "/tmp/cxl-test-XXXXXX";
> -    const char *tmpfs;
> +    g_autofree const char *tmpfs;
>
> -    tmpfs =3D g_mkdtemp(template);
> +    tmpfs =3D g_dir_make_tmp("cxl-test-XXXXXX", NULL);
>
>      g_string_printf(cmdline, QEMU_PXB_CMD QEMU_RP QEMU_T3D, tmpfs, tmpfs=
);
>
> @@ -107,10 +106,9 @@ static void cxl_t3d(void)
>  static void cxl_1pxb_2rp_2t3d(void)
>  {
>      g_autoptr(GString) cmdline =3D g_string_new(NULL);
> -    char template[] =3D "/tmp/cxl-test-XXXXXX";
> -    const char *tmpfs;
> +    g_autofree const char *tmpfs;
>
> -    tmpfs =3D g_mkdtemp(template);
> +    tmpfs =3D g_dir_make_tmp("cxl-test-XXXXXX", NULL);
>
>      g_string_printf(cmdline, QEMU_PXB_CMD QEMU_2RP QEMU_2T3D,
>                      tmpfs, tmpfs, tmpfs, tmpfs);
> @@ -122,10 +120,9 @@ static void cxl_1pxb_2rp_2t3d(void)
>  static void cxl_2pxb_4rp_4t3d(void)
>  {
>      g_autoptr(GString) cmdline =3D g_string_new(NULL);
> -    char template[] =3D "/tmp/cxl-test-XXXXXX";
> -    const char *tmpfs;
> +    g_autofree const char *tmpfs;
>
> -    tmpfs =3D g_mkdtemp(template);
> +    tmpfs =3D g_dir_make_tmp("cxl-test-XXXXXX", NULL);
>
>      g_string_printf(cmdline, QEMU_2PXB_CMD QEMU_4RP QEMU_4T3D,
>                      tmpfs, tmpfs, tmpfs, tmpfs, tmpfs, tmpfs,
> diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
> index 52ade90a7d..1f9b99ad6d 100644
> --- a/tests/qtest/fdc-test.c
> +++ b/tests/qtest/fdc-test.c
> @@ -68,7 +68,7 @@ enum {
>      DSKCHG  =3D 0x80,
>  };
>
> -static char test_image[] =3D "/tmp/qtest.XXXXXX";
> +static char *test_image;
>
>  #define assert_bit_set(data, mask) g_assert_cmphex((data) & (mask), =3D=
=3D,
> (mask))
>  #define assert_bit_clear(data, mask) g_assert_cmphex((data) & (mask), =
=3D=3D,
> 0)
> @@ -608,7 +608,7 @@ int main(int argc, char **argv)
>      int ret;
>
>      /* Create a temporary raw image */
> -    fd =3D mkstemp(test_image);
> +    fd =3D g_file_open_tmp("qtest.XXXXXX", &test_image, NULL);
>      g_assert(fd >=3D 0);
>      ret =3D ftruncate(fd, TEST_IMAGE_SIZE);
>      g_assert(ret =3D=3D 0);
> @@ -640,6 +640,7 @@ int main(int argc, char **argv)
>      /* Cleanup */
>      qtest_end();
>      unlink(test_image);
> +    g_free(test_image);
>
>      return ret;
>  }
> diff --git a/tests/qtest/fuzz/virtio_blk_fuzz.c
> b/tests/qtest/fuzz/virtio_blk_fuzz.c
> index 236d078cc8..a9fb9ecf6c 100644
> --- a/tests/qtest/fuzz/virtio_blk_fuzz.c
> +++ b/tests/qtest/fuzz/virtio_blk_fuzz.c
> @@ -181,10 +181,10 @@ static void drive_destroy(void *path)
>  static char *drive_create(void)
>  {
>      int fd, ret;
> -    char *t_path =3D g_strdup("/tmp/qtest.XXXXXX");
> +    char *t_path;
>
>      /* Create a temporary raw image */
> -    fd =3D mkstemp(t_path);
> +    fd =3D g_file_open_tmp("qtest.XXXXXX", &t_path, NULL);
>      g_assert_cmpint(fd, >=3D, 0);
>      ret =3D ftruncate(fd, TEST_IMAGE_SIZE);
>      g_assert_cmpint(ret, =3D=3D, 0);
> diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
> index 413cf964c0..4793954c19 100644
> --- a/tests/qtest/hd-geo-test.c
> +++ b/tests/qtest/hd-geo-test.c
> @@ -27,16 +27,16 @@
>
>  static char *create_test_img(int secs)
>  {
> -    char *template =3D strdup("/tmp/qtest.XXXXXX");
> +    char *template;
>

Why not use g_auto here?

You'll need to replace "return template" with "return
g_steal_pointer(&template)")

I suggest splitting this patch for the various tests.


>      int fd, ret;
>
> -    fd =3D mkstemp(template);
> +    fd =3D g_file_open_tmp("qtest.XXXXXX", &template, NULL);
>      g_assert(fd >=3D 0);
>      ret =3D ftruncate(fd, (off_t)secs * 512);
>      close(fd);
>
>      if (ret) {
> -        free(template);
> +        g_free(template);
>          template =3D NULL;
>      }
>
> @@ -422,9 +422,8 @@ static MBRpartitions empty_mbr =3D { {false, 0, 0, 0,=
 0,
> 0, 0, 0, 0},
>
>  static char *create_qcow2_with_mbr(MBRpartitions mbr, uint64_t sectors)
>  {
> -    const char *template =3D "/tmp/qtest.XXXXXX";
> -    char *raw_path =3D strdup(template);
> -    char *qcow2_path =3D strdup(template);
> +    g_autofree char *raw_path;
> +    char *qcow2_path;
>      char cmd[100 + 2 * PATH_MAX];
>      uint8_t buf[512] =3D {};
>      int i, ret, fd, offset;
> @@ -468,7 +467,7 @@ static char *create_qcow2_with_mbr(MBRpartitions mbr,
> uint64_t sectors)
>          offset +=3D 0x10;
>      }
>
> -    fd =3D mkstemp(raw_path);
> +    fd =3D g_file_open_tmp("qtest.XXXXXX", &raw_path, NULL);
>      g_assert(fd >=3D 0);
>      close(fd);
>
> @@ -478,7 +477,7 @@ static char *create_qcow2_with_mbr(MBRpartitions mbr,
> uint64_t sectors)
>      g_assert(ret =3D=3D sizeof(buf));
>      close(fd);
>
> -    fd =3D mkstemp(qcow2_path);
> +    fd =3D g_file_open_tmp("qtest.XXXXXX", &qcow2_path, NULL);
>      g_assert(fd >=3D 0);
>      close(fd);
>
> @@ -506,7 +505,6 @@ static char *create_qcow2_with_mbr(MBRpartitions mbr,
> uint64_t sectors)
>      free(qemu_img_abs_path);
>
>      unlink(raw_path);
> -    free(raw_path);
>
>      return qcow2_path;
>  }
> @@ -714,7 +712,7 @@ static void test_override(TestArgs *args, CHSResult
> expected[])
>
>      for (i =3D 0; i < args->n_drives; i++) {
>          unlink(args->drives[i]);
> -        free(args->drives[i]);
> +        g_free(args->drives[i]);
>      }
>      g_free(args->drives);
>      g_strfreev(args->argv);
> @@ -867,7 +865,7 @@ static void test_override_scsi_hot_unplug(void)
>
>      for (i =3D 0; i < args->n_drives; i++) {
>          unlink(args->drives[i]);
> -        free(args->drives[i]);
> +        g_free(args->drives[i]);
>      }
>      g_free(args->drives);
>      g_strfreev(args->argv);
> @@ -927,7 +925,7 @@ static void test_override_virtio_hot_unplug(void)
>
>      for (i =3D 0; i < args->n_drives; i++) {
>          unlink(args->drives[i]);
> -        free(args->drives[i]);
> +        g_free(args->drives[i]);
>      }
>      g_free(args->drives);
>      g_strfreev(args->argv);
> @@ -987,7 +985,7 @@ test_add_done:
>      for (i =3D 0; i < backend_last; i++) {
>          if (img_file_name[i]) {
>              unlink(img_file_name[i]);
> -            free(img_file_name[i]);
> +            g_free(img_file_name[i]);
>          }
>      }
>
> diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
> index 5bcb75a7e5..25302be6dc 100644
> --- a/tests/qtest/ide-test.c
> +++ b/tests/qtest/ide-test.c
> @@ -121,8 +121,8 @@ enum {
>  static QPCIBus *pcibus =3D NULL;
>  static QGuestAllocator guest_malloc;
>
> -static char tmp_path[] =3D "/tmp/qtest.XXXXXX";
> -static char debug_path[] =3D "/tmp/qtest-blkdebug.XXXXXX";
> +static char *tmp_path;
> +static char *debug_path;
>
>  static QTestState *ide_test_start(const char *cmdline_fmt, ...)
>  {
> @@ -1015,12 +1015,12 @@ int main(int argc, char **argv)
>      int ret;
>
>      /* Create temporary blkdebug instructions */
> -    fd =3D mkstemp(debug_path);
> +    fd =3D g_file_open_tmp("qtest-blkdebug.XXXXXX", &debug_path, NULL);
>      g_assert(fd >=3D 0);
>      close(fd);
>
>      /* Create a temporary raw image */
> -    fd =3D mkstemp(tmp_path);
> +    fd =3D g_file_open_tmp("qtest.XXXXXX", &tmp_path, NULL);
>      g_assert(fd >=3D 0);
>      ret =3D ftruncate(fd, TEST_IMAGE_SIZE);
>      g_assert(ret =3D=3D 0);
> @@ -1049,7 +1049,9 @@ int main(int argc, char **argv)
>
>      /* Cleanup */
>      unlink(tmp_path);
> +    g_free(tmp_path);
>      unlink(debug_path);
> +    g_free(debug_path);
>
>      return ret;
>  }
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 7c9fc07de4..a0f28ddf8e 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -265,8 +265,10 @@ QTestState *qtest_init_without_qmp_handshake(const
> char *extra_args)
>
>      s =3D g_new(QTestState, 1);
>
> -    socket_path =3D g_strdup_printf("/tmp/qtest-%d.sock", getpid());
> -    qmp_socket_path =3D g_strdup_printf("/tmp/qtest-%d.qmp", getpid());
> +    socket_path =3D g_strdup_printf("%s/qtest-%d.sock",
> +                                  g_get_tmp_dir(), getpid());
> +    qmp_socket_path =3D g_strdup_printf("%s/qtest-%d.qmp",
> +                                      g_get_tmp_dir(), getpid());
>
>      /* It's possible that if an earlier test run crashed it might
>       * have left a stale unix socket lying around. Delete any
> @@ -390,10 +392,12 @@ QTestState *qtest_initf(const char *fmt, ...)
>  QTestState *qtest_init_with_serial(const char *extra_args, int *sock_fd)
>  {
>      int sock_fd_init;
> -    char *sock_path, sock_dir[] =3D "/tmp/qtest-serial-XXXXXX";
> +    g_autofree char *sock_dir;
> +    char *sock_path;
>      QTestState *qts;
>
> -    g_assert_true(g_mkdtemp(sock_dir) !=3D NULL);
> +    sock_dir =3D g_dir_make_tmp("qtest-serial-XXXXXX", NULL);
> +    g_assert_true(sock_dir !=3D NULL);
>      sock_path =3D g_strdup_printf("%s/sock", sock_dir);
>
>      sock_fd_init =3D init_socket(sock_path);
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 55892b3798..9925691ead 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -2435,7 +2435,6 @@ static bool kvm_dirty_ring_supported(void)
>
>  int main(int argc, char **argv)
>  {
> -    char template[] =3D "/tmp/migration-test-XXXXXX";
>      const bool has_kvm =3D qtest_has_accel("kvm");
>      const bool has_uffd =3D ufd_version_check();
>      const char *arch =3D qtest_get_arch();
> @@ -2463,9 +2462,10 @@ int main(int argc, char **argv)
>          return g_test_run();
>      }
>
> -    tmpfs =3D g_mkdtemp(template);
> +    tmpfs =3D g_dir_make_tmp("migration-test-XXXXXX", NULL);
>      if (!tmpfs) {
> -        g_test_message("g_mkdtemp on path (%s): %s", template,
> strerror(errno));
> +        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
> +                       strerror(errno));
>      }
>      g_assert(tmpfs);
>
> @@ -2590,6 +2590,7 @@ int main(int argc, char **argv)
>          g_test_message("unable to rmdir: path (%s): %s",
>                         tmpfs, strerror(errno));
>      }
> +    g_free((gpointer)tmpfs);
>
>      return ret;
>  }
> diff --git a/tests/qtest/pflash-cfi02-test.c
> b/tests/qtest/pflash-cfi02-test.c
> index 7fce614b64..55890b7d95 100644
> --- a/tests/qtest/pflash-cfi02-test.c
> +++ b/tests/qtest/pflash-cfi02-test.c
> @@ -56,7 +56,7 @@ typedef struct {
>      QTestState *qtest;
>  } FlashConfig;
>
> -static char image_path[] =3D "/tmp/qtest.XXXXXX";
> +static char *image_path;
>
>  /*
>   * The pflash implementation allows some parameters to be unspecified. W=
e
> want
> @@ -608,6 +608,7 @@ static void test_cfi_in_autoselect(const void *opaque=
)
>  static void cleanup(void *opaque)
>  {
>      unlink(image_path);
> +    g_free(image_path);
>  }
>
>  /*
> @@ -635,16 +636,17 @@ static const FlashConfig configuration[] =3D {
>
>  int main(int argc, char **argv)
>  {
> -    int fd =3D mkstemp(image_path);
> +    int fd =3D g_file_open_tmp("qtest.XXXXXX", &image_path, NULL);
>      if (fd =3D=3D -1) {
>          g_printerr("Failed to create temporary file %s: %s\n", image_pat=
h,
>                     strerror(errno));
> +        g_free(image_path);
>          exit(EXIT_FAILURE);
>      }
>      if (ftruncate(fd, UNIFORM_FLASH_SIZE) < 0) {
>          int error_code =3D errno;
>          close(fd);
> -        unlink(image_path);
> +        cleanup(NULL);
>          g_printerr("Failed to truncate file %s to %u MB: %s\n",
> image_path,
>                     UNIFORM_FLASH_SIZE, strerror(error_code));
>          exit(EXIT_FAILURE);
> diff --git a/tests/qtest/qmp-test.c b/tests/qtest/qmp-test.c
> index bf7304c7dc..0fa00c12dc 100644
> --- a/tests/qtest/qmp-test.c
> +++ b/tests/qtest/qmp-test.c
> @@ -161,12 +161,13 @@ static void test_qmp_protocol(void)
>
>  /* Out-of-band tests */
>
> -char tmpdir[] =3D "/tmp/qmp-test-XXXXXX";
> +char *tmpdir;
>  char *fifo_name;
>
>  static void setup_blocking_cmd(void)
>  {
> -    if (!g_mkdtemp(tmpdir)) {
> +    tmpdir =3D g_dir_make_tmp("qmp-test-XXXXXX", NULL);
> +    if (!tmpdir) {
>          g_error("g_mkdtemp: %s", strerror(errno));
>      }
>      fifo_name =3D g_strdup_printf("%s/fifo", tmpdir);
> @@ -179,6 +180,7 @@ static void cleanup_blocking_cmd(void)
>  {
>      unlink(fifo_name);
>      rmdir(tmpdir);
> +    g_free(tmpdir);
>  }
>
>  static void send_cmd_that_blocks(QTestState *s, const char *id)
> diff --git a/tests/qtest/vhost-user-blk-test.c
> b/tests/qtest/vhost-user-blk-test.c
> index a81c2a2715..07a4c2d500 100644
> --- a/tests/qtest/vhost-user-blk-test.c
> +++ b/tests/qtest/vhost-user-blk-test.c
> @@ -841,7 +841,8 @@ static char *create_listen_socket(int *fd)
>      char *path;
>
>      /* No race because our pid makes the path unique */
> -    path =3D g_strdup_printf("/tmp/qtest-%d-sock.XXXXXX", getpid());
> +    path =3D g_strdup_printf("%s/qtest-%d-sock.XXXXXX",
> +                           g_get_tmp_dir(), getpid());
>      tmp_fd =3D mkstemp(path);
>      g_assert_cmpint(tmp_fd, >=3D, 0);
>      close(tmp_fd);
> diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.=
c
> index d7d6cfc9bd..4e1aae1794 100644
> --- a/tests/qtest/vhost-user-test.c
> +++ b/tests/qtest/vhost-user-test.c
> @@ -482,8 +482,7 @@ static TestServer *test_server_new(const gchar *name,
>          struct vhost_user_ops *ops)
>  {
>      TestServer *server =3D g_new0(TestServer, 1);
> -    char template[] =3D "/tmp/vhost-test-XXXXXX";
> -    const char *tmpfs;
> +    g_autofree const char *tmpfs;
>
>      server->context =3D g_main_context_new();
>      server->loop =3D g_main_loop_new(server->context, FALSE);
> @@ -491,9 +490,10 @@ static TestServer *test_server_new(const gchar *name=
,
>      /* run the main loop thread so the chardev may operate */
>      server->thread =3D g_thread_new(NULL, thread_function, server->loop)=
;
>
> -    tmpfs =3D g_mkdtemp(template);
> +    tmpfs =3D g_dir_make_tmp("vhost-test-XXXXXX", NULL);
>      if (!tmpfs) {
> -        g_test_message("g_mkdtemp on path (%s): %s", template,
> strerror(errno));
> +        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
> +                       strerror(errno));
>      }
>      g_assert(tmpfs);
>
> diff --git a/tests/qtest/virtio-blk-test.c b/tests/qtest/virtio-blk-test.=
c
> index dc5eed31c8..19c01f808b 100644
> --- a/tests/qtest/virtio-blk-test.c
> +++ b/tests/qtest/virtio-blk-test.c
> @@ -49,10 +49,10 @@ static void drive_destroy(void *path)
>  static char *drive_create(void)
>  {
>      int fd, ret;
> -    char *t_path =3D g_strdup("/tmp/qtest.XXXXXX");
> +    char *t_path;
>
>      /* Create a temporary raw image */
> -    fd =3D mkstemp(t_path);
> +    fd =3D g_file_open_tmp("qtest.XXXXXX", &t_path, NULL);
>      g_assert_cmpint(fd, >=3D, 0);
>      ret =3D ftruncate(fd, TEST_IMAGE_SIZE);
>      g_assert_cmpint(ret, =3D=3D, 0);
> diff --git a/tests/qtest/virtio-scsi-test.c
> b/tests/qtest/virtio-scsi-test.c
> index 8ceb12aacd..073a89d535 100644
> --- a/tests/qtest/virtio-scsi-test.c
> +++ b/tests/qtest/virtio-scsi-test.c
> @@ -268,7 +268,7 @@ static void test_iothread_attach_node(void *obj, void
> *data,
>      QVirtioSCSIPCI *scsi_pci =3D obj;
>      QVirtioSCSI *scsi =3D &scsi_pci->scsi;
>      QVirtioSCSIQueues *vs;
> -    char tmp_path[] =3D "/tmp/qtest.XXXXXX";
> +    g_autofree char *tmp_path;
>      int fd;
>      int ret;
>
> @@ -282,7 +282,7 @@ static void test_iothread_attach_node(void *obj, void
> *data,
>      vs =3D qvirtio_scsi_init(scsi->vdev);
>
>      /* Create a temporary qcow2 overlay*/
> -    fd =3D mkstemp(tmp_path);
> +    fd =3D g_file_open_tmp("qtest.XXXXXX", &tmp_path, NULL);
>      g_assert(fd >=3D 0);
>      close(fd);
>
> diff --git a/tests/unit/test-image-locking.c
> b/tests/unit/test-image-locking.c
> index ba057bd66c..d09ff43fcb 100644
> --- a/tests/unit/test-image-locking.c
> +++ b/tests/unit/test-image-locking.c
> @@ -76,10 +76,10 @@ static void check_locked_bytes(int fd, uint64_t
> perm_locks,
>  static void test_image_locking_basic(void)
>  {
>      BlockBackend *blk1, *blk2, *blk3;
> -    char img_path[] =3D "/tmp/qtest.XXXXXX";
> +    g_autofree char *img_path;
>      uint64_t perm, shared_perm;
>
> -    int fd =3D mkstemp(img_path);
> +    int fd =3D g_file_open_tmp("qtest.XXXXXX", &img_path, NULL);
>      assert(fd >=3D 0);
>
>      perm =3D BLK_PERM_WRITE | BLK_PERM_CONSISTENT_READ;
> @@ -117,10 +117,10 @@ static void test_image_locking_basic(void)
>  static void test_set_perm_abort(void)
>  {
>      BlockBackend *blk1, *blk2;
> -    char img_path[] =3D "/tmp/qtest.XXXXXX";
> +    g_autofree char *img_path;
>      uint64_t perm, shared_perm;
>      int r;
> -    int fd =3D mkstemp(img_path);
> +    int fd =3D g_file_open_tmp("qtest.XXXXXX", &img_path, NULL);
>      assert(fd >=3D 0);
>
>      perm =3D BLK_PERM_WRITE | BLK_PERM_CONSISTENT_READ;
> diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
> index a05a4628ed..b73d231cd5 100644
> --- a/tests/unit/test-qga.c
> +++ b/tests/unit/test-qga.c
> @@ -59,7 +59,7 @@ fixture_setup(TestFixture *fixture, gconstpointer data,
> gchar **envp)
>
>      fixture->loop =3D g_main_loop_new(NULL, FALSE);
>
> -    fixture->test_dir =3D g_strdup("/tmp/qgatest.XXXXXX");
> +    fixture->test_dir =3D g_strdup_printf("%s/qgatest.XXXXXX",
> g_get_tmp_dir());
>      g_assert_nonnull(g_mkdtemp(fixture->test_dir));
>
>      path =3D g_build_filename(fixture->test_dir, "sock", NULL);
> diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c
> index 9b1dab2f28..fecdf915e7 100644
> --- a/tests/vhost-user-bridge.c
> +++ b/tests/vhost-user-bridge.c
> @@ -631,7 +631,6 @@ static void *notifier_thread(void *arg)
>  static void
>  vubr_host_notifier_setup(VubrDev *dev)
>  {
> -    char template[] =3D "/tmp/vubr-XXXXXX";
>      pthread_t thread;
>      size_t length;
>      void *addr;
> @@ -639,7 +638,7 @@ vubr_host_notifier_setup(VubrDev *dev)
>
>      length =3D qemu_real_host_page_size() * VHOST_USER_BRIDGE_MAX_QUEUES=
;
>
> -    fd =3D mkstemp(template);
> +    fd =3D g_file_open_tmp("vubr-XXXXXX", NULL, NULL);
>      if (fd < 0) {
>          vubr_die("mkstemp()");
>      }
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000e7a73405e94952d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 20, 2022 at 2:47 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin=
 Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.m=
eng@windriver.com</a>&gt;<br>
<br>
Lots of test cases were written to use hardcoded /tmp directory for<br>
temporary files. To avoid this, we update them to use g_dir_make_tmp()<br>
or g_file_open_tmp() when appropriate.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
Changes in v2:<br>
- Use g_dir_make_tmp(), g_file_open_tmp() when appropriate<br>
<br>
=C2=A0tests/qtest/fuzz/generic_fuzz_configs.h |=C2=A0 4 ++--<br>
=C2=A0tests/qtest/ahci-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 19 +++++++++++--------<br>
=C2=A0tests/qtest/aspeed_smc-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 5 ++---<br>
=C2=A0tests/qtest/boot-serial-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 9 +++++----<br>
=C2=A0tests/qtest/cxl-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 15 ++++++---------<br>
=C2=A0tests/qtest/fdc-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 5 +++--<br>
=C2=A0tests/qtest/fuzz/virtio_blk_fuzz.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--=
<br>
=C2=A0tests/qtest/hd-geo-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 24 +++++++++++-------------<br>
=C2=A0tests/qtest/ide-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 10 ++++++----<br>
=C2=A0tests/qtest/libqtest.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 12 ++++++++----<br>
=C2=A0tests/qtest/migration-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 7 ++++---<br>
=C2=A0tests/qtest/pflash-cfi02-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 8 +++++---<br>
=C2=A0tests/qtest/qmp-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++++--<br>
=C2=A0tests/qtest/vhost-user-blk-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3=
 ++-<br>
=C2=A0tests/qtest/vhost-user-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 8 ++++----<br>
=C2=A0tests/qtest/virtio-blk-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 4 ++--<br>
=C2=A0tests/qtest/virtio-scsi-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 4 ++--<br>
=C2=A0tests/unit/test-image-locking.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 8 ++++----<br>
=C2=A0tests/unit/test-qga.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0tests/vhost-user-bridge.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 3 +--<br>
=C2=A020 files changed, 85 insertions(+), 75 deletions(-)<br>
<br>
diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/gen=
eric_fuzz_configs.h<br>
index 0775e6702b..a825b78c14 100644<br>
--- a/tests/qtest/fuzz/generic_fuzz_configs.h<br>
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h<br>
@@ -20,8 +20,8 @@ typedef struct generic_fuzz_config {<br>
=C2=A0} generic_fuzz_config;<br>
<br>
=C2=A0static inline gchar *generic_fuzzer_virtio_9p_args(void){<br>
-=C2=A0 =C2=A0 char tmpdir[] =3D &quot;/tmp/qemu-fuzz.XXXXXX&quot;;<br>
-=C2=A0 =C2=A0 g_assert_nonnull(g_mkdtemp(tmpdir));<br>
+=C2=A0 =C2=A0 g_autofree char *tmpdir =3D g_dir_make_tmp(&quot;qemu-fuzz.X=
XXXXX&quot;, NULL);<br>
+=C2=A0 =C2=A0 g_assert_nonnull(tmpdir);<br>
<br>
=C2=A0 =C2=A0 =C2=A0return g_strdup_printf(&quot;-machine q35 -nodefaults &=
quot;<br>
=C2=A0 =C2=A0 =C2=A0&quot;-device virtio-9p,fsdev=3Dhshare,mount_tag=3Dhsha=
re &quot;<br>
diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c<br>
index f1e510b0ac..00524f14c6 100644<br>
--- a/tests/qtest/ahci-test.c<br>
+++ b/tests/qtest/ahci-test.c<br>
@@ -44,9 +44,9 @@<br>
=C2=A0#define TEST_IMAGE_SIZE_MB_SMALL 64<br>
<br>
=C2=A0/*** Globals ***/<br>
-static char tmp_path[] =3D &quot;/tmp/qtest.XXXXXX&quot;;<br>
-static char debug_path[] =3D &quot;/tmp/qtest-blkdebug.XXXXXX&quot;;<br>
-static char mig_socket[] =3D &quot;/tmp/qtest-migration.XXXXXX&quot;;<br>
+static char *tmp_path;<br>
+static char *debug_path;<br>
+static char *mig_socket;<br>
=C2=A0static bool ahci_pedantic;<br>
=C2=A0static const char *imgfmt;<br>
=C2=A0static unsigned test_image_size_mb;<br>
@@ -1437,10 +1437,10 @@ static void test_ncq_simple(void)<br>
<br>
=C2=A0static int prepare_iso(size_t size, unsigned char **buf, char **name)=
<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 char cdrom_path[] =3D &quot;/tmp/qtest.iso.XXXXXX&quot;;<br>
+=C2=A0 =C2=A0 g_autofree char *cdrom_path;<br></blockquote><div><br></div>=
<div>Whenever introducing g_auto* usage, please make sure to initialize the=
 variable to NULL or a correct value.</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0unsigned char *patt;<br>
=C2=A0 =C2=A0 =C2=A0ssize_t ret;<br>
-=C2=A0 =C2=A0 int fd =3D mkstemp(cdrom_path);<br>
+=C2=A0 =C2=A0 int fd =3D g_file_open_tmp(&quot;qtest.iso.XXXXXX&quot;, &am=
p;cdrom_path, NULL);<br>
<br>
=C2=A0 =C2=A0 =C2=A0g_assert(fd !=3D -1);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(buf);<br>
@@ -1872,7 +1872,7 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Create a temporary image */<br>
-=C2=A0 =C2=A0 fd =3D mkstemp(tmp_path);<br>
+=C2=A0 =C2=A0 fd =3D g_file_open_tmp(&quot;qtest.XXXXXX&quot;, &amp;tmp_pa=
th, NULL);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(fd &gt;=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0if (have_qemu_img()) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0imgfmt =3D &quot;qcow2&quot;;<br>
@@ -1889,12 +1889,12 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0close(fd);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Create temporary blkdebug instructions */<br>
-=C2=A0 =C2=A0 fd =3D mkstemp(debug_path);<br>
+=C2=A0 =C2=A0 fd =3D g_file_open_tmp(&quot;qtest-blkdebug.XXXXXX&quot;, &a=
mp;debug_path, NULL);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(fd &gt;=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0close(fd);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Reserve a hollow file to use as a socket for migrati=
on tests */<br>
-=C2=A0 =C2=A0 fd =3D mkstemp(mig_socket);<br>
+=C2=A0 =C2=A0 fd =3D g_file_open_tmp(&quot;qtest-migration.XXXXXX&quot;, &=
amp;mig_socket, NULL);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(fd &gt;=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0close(fd);<br>
<br>
@@ -1947,8 +1947,11 @@ int main(int argc, char **argv)<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Cleanup */<br>
=C2=A0 =C2=A0 =C2=A0unlink(tmp_path);<br>
+=C2=A0 =C2=A0 g_free(tmp_path);<br>
=C2=A0 =C2=A0 =C2=A0unlink(debug_path);<br>
+=C2=A0 =C2=A0 g_free(debug_path);<br>
=C2=A0 =C2=A0 =C2=A0unlink(mig_socket);<br>
+=C2=A0 =C2=A0 g_free(mig_socket);<br>
<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c<=
br>
index 05ce941566..5e16b5c9a5 100644<br>
--- a/tests/qtest/aspeed_smc-test.c<br>
+++ b/tests/qtest/aspeed_smc-test.c<br>
@@ -608,16 +608,15 @@ static void test_write_block_protect_bottom_bit(void)=
<br>
=C2=A0 =C2=A0 =C2=A0flash_reset();<br>
=C2=A0}<br>
<br>
-static char tmp_path[] =3D &quot;/tmp/qtest.m25p80.XXXXXX&quot;;<br>
-<br>
=C2=A0int main(int argc, char **argv)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 g_autofree char *tmp_path;<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
=C2=A0 =C2=A0 =C2=A0int fd;<br>
<br>
=C2=A0 =C2=A0 =C2=A0g_test_init(&amp;argc, &amp;argv, NULL);<br>
<br>
-=C2=A0 =C2=A0 fd =3D mkstemp(tmp_path);<br>
+=C2=A0 =C2=A0 fd =3D g_file_open_tmp(&quot;qtest.m25p80.XXXXXX&quot;, &amp=
;tmp_path, NULL);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(fd &gt;=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0ret =3D ftruncate(fd, FLASH_SIZE);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(ret =3D=3D 0);<br>
diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.=
c<br>
index 2f99d71cab..ce6e3d3eb8 100644<br>
--- a/tests/qtest/boot-serial-test.c<br>
+++ b/tests/qtest/boot-serial-test.c<br>
@@ -224,14 +224,14 @@ static bool check_guest_output(QTestState *qts, const=
 testdef_t *test, int fd)<br>
=C2=A0static void test_machine(const void *data)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const testdef_t *test =3D data;<br>
-=C2=A0 =C2=A0 char serialtmp[] =3D &quot;/tmp/qtest-boot-serial-sXXXXXX&qu=
ot;;<br>
-=C2=A0 =C2=A0 char codetmp[] =3D &quot;/tmp/qtest-boot-serial-cXXXXXX&quot=
;;<br>
+=C2=A0 =C2=A0 g_autofree char *serialtmp;<br>
+=C2=A0 =C2=A0 char *codetmp;<br>
=C2=A0 =C2=A0 =C2=A0const char *codeparam =3D &quot;&quot;;<br>
=C2=A0 =C2=A0 =C2=A0const uint8_t *code =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0QTestState *qts;<br>
=C2=A0 =C2=A0 =C2=A0int ser_fd;<br>
<br>
-=C2=A0 =C2=A0 ser_fd =3D mkstemp(serialtmp);<br>
+=C2=A0 =C2=A0 ser_fd =3D g_file_open_tmp(&quot;qtest-boot-serial-sXXXXXX&q=
uot;, &amp;serialtmp, NULL);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(ser_fd !=3D -1);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (test-&gt;kernel) {<br>
@@ -246,7 +246,7 @@ static void test_machine(const void *data)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssize_t wlen;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int code_fd;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 code_fd =3D mkstemp(codetmp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 code_fd =3D g_file_open_tmp(&quot;qtest-boot-s=
erial-cXXXXXX&quot;, &amp;codetmp, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert(code_fd !=3D -1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wlen =3D write(code_fd, code, test-&gt;co=
desize);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert(wlen =3D=3D test-&gt;codesize);<=
br>
@@ -264,6 +264,7 @@ static void test_machine(const void *data)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0serialtmp, test-&gt;extra);<br>
=C2=A0 =C2=A0 =C2=A0if (code) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unlink(codetmp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(codetmp);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!check_guest_output(qts, test, ser_fd)) {<br>
diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c<br>
index 2e14da7dee..4f3ea76fa3 100644<br>
--- a/tests/qtest/cxl-test.c<br>
+++ b/tests/qtest/cxl-test.c<br>
@@ -93,10 +93,9 @@ static void cxl_2root_port(void)<br>
=C2=A0static void cxl_t3d(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0g_autoptr(GString) cmdline =3D g_string_new(NULL);<br>
-=C2=A0 =C2=A0 char template[] =3D &quot;/tmp/cxl-test-XXXXXX&quot;;<br>
-=C2=A0 =C2=A0 const char *tmpfs;<br>
+=C2=A0 =C2=A0 g_autofree const char *tmpfs;<br>
<br>
-=C2=A0 =C2=A0 tmpfs =3D g_mkdtemp(template);<br>
+=C2=A0 =C2=A0 tmpfs =3D g_dir_make_tmp(&quot;cxl-test-XXXXXX&quot;, NULL);=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0g_string_printf(cmdline, QEMU_PXB_CMD QEMU_RP QEMU_T3D,=
 tmpfs, tmpfs);<br>
<br>
@@ -107,10 +106,9 @@ static void cxl_t3d(void)<br>
=C2=A0static void cxl_1pxb_2rp_2t3d(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0g_autoptr(GString) cmdline =3D g_string_new(NULL);<br>
-=C2=A0 =C2=A0 char template[] =3D &quot;/tmp/cxl-test-XXXXXX&quot;;<br>
-=C2=A0 =C2=A0 const char *tmpfs;<br>
+=C2=A0 =C2=A0 g_autofree const char *tmpfs;<br>
<br>
-=C2=A0 =C2=A0 tmpfs =3D g_mkdtemp(template);<br>
+=C2=A0 =C2=A0 tmpfs =3D g_dir_make_tmp(&quot;cxl-test-XXXXXX&quot;, NULL);=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0g_string_printf(cmdline, QEMU_PXB_CMD QEMU_2RP QEMU_2T3=
D,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0tmpfs, tmpfs, tmpfs, tmpfs);<br>
@@ -122,10 +120,9 @@ static void cxl_1pxb_2rp_2t3d(void)<br>
=C2=A0static void cxl_2pxb_4rp_4t3d(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0g_autoptr(GString) cmdline =3D g_string_new(NULL);<br>
-=C2=A0 =C2=A0 char template[] =3D &quot;/tmp/cxl-test-XXXXXX&quot;;<br>
-=C2=A0 =C2=A0 const char *tmpfs;<br>
+=C2=A0 =C2=A0 g_autofree const char *tmpfs;<br>
<br>
-=C2=A0 =C2=A0 tmpfs =3D g_mkdtemp(template);<br>
+=C2=A0 =C2=A0 tmpfs =3D g_dir_make_tmp(&quot;cxl-test-XXXXXX&quot;, NULL);=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0g_string_printf(cmdline, QEMU_2PXB_CMD QEMU_4RP QEMU_4T=
3D,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0tmpfs, tmpfs, tmpfs, tmpfs, tmpfs, tmpfs,<br>
diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c<br>
index 52ade90a7d..1f9b99ad6d 100644<br>
--- a/tests/qtest/fdc-test.c<br>
+++ b/tests/qtest/fdc-test.c<br>
@@ -68,7 +68,7 @@ enum {<br>
=C2=A0 =C2=A0 =C2=A0DSKCHG=C2=A0 =3D 0x80,<br>
=C2=A0};<br>
<br>
-static char test_image[] =3D &quot;/tmp/qtest.XXXXXX&quot;;<br>
+static char *test_image;<br>
<br>
=C2=A0#define assert_bit_set(data, mask) g_assert_cmphex((data) &amp; (mask=
), =3D=3D, (mask))<br>
=C2=A0#define assert_bit_clear(data, mask) g_assert_cmphex((data) &amp; (ma=
sk), =3D=3D, 0)<br>
@@ -608,7 +608,7 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Create a temporary raw image */<br>
-=C2=A0 =C2=A0 fd =3D mkstemp(test_image);<br>
+=C2=A0 =C2=A0 fd =3D g_file_open_tmp(&quot;qtest.XXXXXX&quot;, &amp;test_i=
mage, NULL);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(fd &gt;=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0ret =3D ftruncate(fd, TEST_IMAGE_SIZE);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(ret =3D=3D 0);<br>
@@ -640,6 +640,7 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0/* Cleanup */<br>
=C2=A0 =C2=A0 =C2=A0qtest_end();<br>
=C2=A0 =C2=A0 =C2=A0unlink(test_image);<br>
+=C2=A0 =C2=A0 g_free(test_image);<br>
<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
diff --git a/tests/qtest/fuzz/virtio_blk_fuzz.c b/tests/qtest/fuzz/virtio_b=
lk_fuzz.c<br>
index 236d078cc8..a9fb9ecf6c 100644<br>
--- a/tests/qtest/fuzz/virtio_blk_fuzz.c<br>
+++ b/tests/qtest/fuzz/virtio_blk_fuzz.c<br>
@@ -181,10 +181,10 @@ static void drive_destroy(void *path)<br>
=C2=A0static char *drive_create(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int fd, ret;<br>
-=C2=A0 =C2=A0 char *t_path =3D g_strdup(&quot;/tmp/qtest.XXXXXX&quot;);<br=
>
+=C2=A0 =C2=A0 char *t_path;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Create a temporary raw image */<br>
-=C2=A0 =C2=A0 fd =3D mkstemp(t_path);<br>
+=C2=A0 =C2=A0 fd =3D g_file_open_tmp(&quot;qtest.XXXXXX&quot;, &amp;t_path=
, NULL);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(fd, &gt;=3D, 0);<br>
=C2=A0 =C2=A0 =C2=A0ret =3D ftruncate(fd, TEST_IMAGE_SIZE);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(ret, =3D=3D, 0);<br>
diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c<br>
index 413cf964c0..4793954c19 100644<br>
--- a/tests/qtest/hd-geo-test.c<br>
+++ b/tests/qtest/hd-geo-test.c<br>
@@ -27,16 +27,16 @@<br>
<br>
=C2=A0static char *create_test_img(int secs)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 char *template =3D strdup(&quot;/tmp/qtest.XXXXXX&quot;);<br=
>
+=C2=A0 =C2=A0 char *template;<br></blockquote><div><br></div><div>Why not =
use g_auto here?</div><div><br></div><div>You&#39;ll need to replace &quot;=
return template&quot; with &quot;return g_steal_pointer(&amp;template)&quot=
;)</div><div><br></div><div>I suggest splitting this patch for the various =
tests.<br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
=C2=A0 =C2=A0 =C2=A0int fd, ret;<br>
<br>
-=C2=A0 =C2=A0 fd =3D mkstemp(template);<br>
+=C2=A0 =C2=A0 fd =3D g_file_open_tmp(&quot;qtest.XXXXXX&quot;, &amp;templa=
te, NULL);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(fd &gt;=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0ret =3D ftruncate(fd, (off_t)secs * 512);<br>
=C2=A0 =C2=A0 =C2=A0close(fd);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 free(template);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(template);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0template =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -422,9 +422,8 @@ static MBRpartitions empty_mbr =3D { {false, 0, 0, 0, 0=
, 0, 0, 0, 0},<br>
<br>
=C2=A0static char *create_qcow2_with_mbr(MBRpartitions mbr, uint64_t sector=
s)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 const char *template =3D &quot;/tmp/qtest.XXXXXX&quot;;<br>
-=C2=A0 =C2=A0 char *raw_path =3D strdup(template);<br>
-=C2=A0 =C2=A0 char *qcow2_path =3D strdup(template);<br>
+=C2=A0 =C2=A0 g_autofree char *raw_path;<br>
+=C2=A0 =C2=A0 char *qcow2_path;<br>
=C2=A0 =C2=A0 =C2=A0char cmd[100 + 2 * PATH_MAX];<br>
=C2=A0 =C2=A0 =C2=A0uint8_t buf[512] =3D {};<br>
=C2=A0 =C2=A0 =C2=A0int i, ret, fd, offset;<br>
@@ -468,7 +467,7 @@ static char *create_qcow2_with_mbr(MBRpartitions mbr, u=
int64_t sectors)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset +=3D 0x10;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 fd =3D mkstemp(raw_path);<br>
+=C2=A0 =C2=A0 fd =3D g_file_open_tmp(&quot;qtest.XXXXXX&quot;, &amp;raw_pa=
th, NULL);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(fd &gt;=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0close(fd);<br>
<br>
@@ -478,7 +477,7 @@ static char *create_qcow2_with_mbr(MBRpartitions mbr, u=
int64_t sectors)<br>
=C2=A0 =C2=A0 =C2=A0g_assert(ret =3D=3D sizeof(buf));<br>
=C2=A0 =C2=A0 =C2=A0close(fd);<br>
<br>
-=C2=A0 =C2=A0 fd =3D mkstemp(qcow2_path);<br>
+=C2=A0 =C2=A0 fd =3D g_file_open_tmp(&quot;qtest.XXXXXX&quot;, &amp;qcow2_=
path, NULL);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(fd &gt;=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0close(fd);<br>
<br>
@@ -506,7 +505,6 @@ static char *create_qcow2_with_mbr(MBRpartitions mbr, u=
int64_t sectors)<br>
=C2=A0 =C2=A0 =C2=A0free(qemu_img_abs_path);<br>
<br>
=C2=A0 =C2=A0 =C2=A0unlink(raw_path);<br>
-=C2=A0 =C2=A0 free(raw_path);<br>
<br>
=C2=A0 =C2=A0 =C2=A0return qcow2_path;<br>
=C2=A0}<br>
@@ -714,7 +712,7 @@ static void test_override(TestArgs *args, CHSResult exp=
ected[])<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; args-&gt;n_drives; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unlink(args-&gt;drives[i]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 free(args-&gt;drives[i]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(args-&gt;drives[i]);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0g_free(args-&gt;drives);<br>
=C2=A0 =C2=A0 =C2=A0g_strfreev(args-&gt;argv);<br>
@@ -867,7 +865,7 @@ static void test_override_scsi_hot_unplug(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; args-&gt;n_drives; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unlink(args-&gt;drives[i]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 free(args-&gt;drives[i]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(args-&gt;drives[i]);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0g_free(args-&gt;drives);<br>
=C2=A0 =C2=A0 =C2=A0g_strfreev(args-&gt;argv);<br>
@@ -927,7 +925,7 @@ static void test_override_virtio_hot_unplug(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; args-&gt;n_drives; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unlink(args-&gt;drives[i]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 free(args-&gt;drives[i]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(args-&gt;drives[i]);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0g_free(args-&gt;drives);<br>
=C2=A0 =C2=A0 =C2=A0g_strfreev(args-&gt;argv);<br>
@@ -987,7 +985,7 @@ test_add_done:<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; backend_last; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (img_file_name[i]) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unlink(img_file_name[i]);<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(img_file_name[i]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(img_file_name[i]);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c<br>
index 5bcb75a7e5..25302be6dc 100644<br>
--- a/tests/qtest/ide-test.c<br>
+++ b/tests/qtest/ide-test.c<br>
@@ -121,8 +121,8 @@ enum {<br>
=C2=A0static QPCIBus *pcibus =3D NULL;<br>
=C2=A0static QGuestAllocator guest_malloc;<br>
<br>
-static char tmp_path[] =3D &quot;/tmp/qtest.XXXXXX&quot;;<br>
-static char debug_path[] =3D &quot;/tmp/qtest-blkdebug.XXXXXX&quot;;<br>
+static char *tmp_path;<br>
+static char *debug_path;<br>
<br>
=C2=A0static QTestState *ide_test_start(const char *cmdline_fmt, ...)<br>
=C2=A0{<br>
@@ -1015,12 +1015,12 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Create temporary blkdebug instructions */<br>
-=C2=A0 =C2=A0 fd =3D mkstemp(debug_path);<br>
+=C2=A0 =C2=A0 fd =3D g_file_open_tmp(&quot;qtest-blkdebug.XXXXXX&quot;, &a=
mp;debug_path, NULL);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(fd &gt;=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0close(fd);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Create a temporary raw image */<br>
-=C2=A0 =C2=A0 fd =3D mkstemp(tmp_path);<br>
+=C2=A0 =C2=A0 fd =3D g_file_open_tmp(&quot;qtest.XXXXXX&quot;, &amp;tmp_pa=
th, NULL);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(fd &gt;=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0ret =3D ftruncate(fd, TEST_IMAGE_SIZE);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(ret =3D=3D 0);<br>
@@ -1049,7 +1049,9 @@ int main(int argc, char **argv)<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Cleanup */<br>
=C2=A0 =C2=A0 =C2=A0unlink(tmp_path);<br>
+=C2=A0 =C2=A0 g_free(tmp_path);<br>
=C2=A0 =C2=A0 =C2=A0unlink(debug_path);<br>
+=C2=A0 =C2=A0 g_free(debug_path);<br>
<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c<br>
index 7c9fc07de4..a0f28ddf8e 100644<br>
--- a/tests/qtest/libqtest.c<br>
+++ b/tests/qtest/libqtest.c<br>
@@ -265,8 +265,10 @@ QTestState *qtest_init_without_qmp_handshake(const cha=
r *extra_args)<br>
<br>
=C2=A0 =C2=A0 =C2=A0s =3D g_new(QTestState, 1);<br>
<br>
-=C2=A0 =C2=A0 socket_path =3D g_strdup_printf(&quot;/tmp/qtest-%d.sock&quo=
t;, getpid());<br>
-=C2=A0 =C2=A0 qmp_socket_path =3D g_strdup_printf(&quot;/tmp/qtest-%d.qmp&=
quot;, getpid());<br>
+=C2=A0 =C2=A0 socket_path =3D g_strdup_printf(&quot;%s/qtest-%d.sock&quot;=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_get_tmp_dir(), getpid());<b=
r>
+=C2=A0 =C2=A0 qmp_socket_path =3D g_strdup_printf(&quot;%s/qtest-%d.qmp&qu=
ot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_get_tmp_dir()=
, getpid());<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* It&#39;s possible that if an earlier test run crashe=
d it might<br>
=C2=A0 =C2=A0 =C2=A0 * have left a stale unix socket lying around. Delete a=
ny<br>
@@ -390,10 +392,12 @@ QTestState *qtest_initf(const char *fmt, ...)<br>
=C2=A0QTestState *qtest_init_with_serial(const char *extra_args, int *sock_=
fd)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int sock_fd_init;<br>
-=C2=A0 =C2=A0 char *sock_path, sock_dir[] =3D &quot;/tmp/qtest-serial-XXXX=
XX&quot;;<br>
+=C2=A0 =C2=A0 g_autofree char *sock_dir;<br>
+=C2=A0 =C2=A0 char *sock_path;<br>
=C2=A0 =C2=A0 =C2=A0QTestState *qts;<br>
<br>
-=C2=A0 =C2=A0 g_assert_true(g_mkdtemp(sock_dir) !=3D NULL);<br>
+=C2=A0 =C2=A0 sock_dir =3D g_dir_make_tmp(&quot;qtest-serial-XXXXXX&quot;,=
 NULL);<br>
+=C2=A0 =C2=A0 g_assert_true(sock_dir !=3D NULL);<br>
=C2=A0 =C2=A0 =C2=A0sock_path =3D g_strdup_printf(&quot;%s/sock&quot;, sock=
_dir);<br>
<br>
=C2=A0 =C2=A0 =C2=A0sock_fd_init =3D init_socket(sock_path);<br>
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c<br=
>
index 55892b3798..9925691ead 100644<br>
--- a/tests/qtest/migration-test.c<br>
+++ b/tests/qtest/migration-test.c<br>
@@ -2435,7 +2435,6 @@ static bool kvm_dirty_ring_supported(void)<br>
<br>
=C2=A0int main(int argc, char **argv)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 char template[] =3D &quot;/tmp/migration-test-XXXXXX&quot;;<=
br>
=C2=A0 =C2=A0 =C2=A0const bool has_kvm =3D qtest_has_accel(&quot;kvm&quot;)=
;<br>
=C2=A0 =C2=A0 =C2=A0const bool has_uffd =3D ufd_version_check();<br>
=C2=A0 =C2=A0 =C2=A0const char *arch =3D qtest_get_arch();<br>
@@ -2463,9 +2462,10 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return g_test_run();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 tmpfs =3D g_mkdtemp(template);<br>
+=C2=A0 =C2=A0 tmpfs =3D g_dir_make_tmp(&quot;migration-test-XXXXXX&quot;, =
NULL);<br>
=C2=A0 =C2=A0 =C2=A0if (!tmpfs) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_test_message(&quot;g_mkdtemp on path (%s): %=
s&quot;, template, strerror(errno));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_test_message(&quot;g_dir_make_tmp on path (%=
s): %s&quot;, tmpfs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0strerror(errno));<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0g_assert(tmpfs);<br>
<br>
@@ -2590,6 +2590,7 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_test_message(&quot;unable to rmdir: pat=
h (%s): %s&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tmpfs, strerror(errno));<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 g_free((gpointer)tmpfs);<br>
<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
diff --git a/tests/qtest/pflash-cfi02-test.c b/tests/qtest/pflash-cfi02-tes=
t.c<br>
index 7fce614b64..55890b7d95 100644<br>
--- a/tests/qtest/pflash-cfi02-test.c<br>
+++ b/tests/qtest/pflash-cfi02-test.c<br>
@@ -56,7 +56,7 @@ typedef struct {<br>
=C2=A0 =C2=A0 =C2=A0QTestState *qtest;<br>
=C2=A0} FlashConfig;<br>
<br>
-static char image_path[] =3D &quot;/tmp/qtest.XXXXXX&quot;;<br>
+static char *image_path;<br>
<br>
=C2=A0/*<br>
=C2=A0 * The pflash implementation allows some parameters to be unspecified=
. We want<br>
@@ -608,6 +608,7 @@ static void test_cfi_in_autoselect(const void *opaque)<=
br>
=C2=A0static void cleanup(void *opaque)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0unlink(image_path);<br>
+=C2=A0 =C2=A0 g_free(image_path);<br>
=C2=A0}<br>
<br>
=C2=A0/*<br>
@@ -635,16 +636,17 @@ static const FlashConfig configuration[] =3D {<br>
<br>
=C2=A0int main(int argc, char **argv)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 int fd =3D mkstemp(image_path);<br>
+=C2=A0 =C2=A0 int fd =3D g_file_open_tmp(&quot;qtest.XXXXXX&quot;, &amp;im=
age_path, NULL);<br>
=C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_printerr(&quot;Failed to create tempora=
ry file %s: %s\n&quot;, image_path,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strer=
ror(errno));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(image_path);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(EXIT_FAILURE);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (ftruncate(fd, UNIFORM_FLASH_SIZE) &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int error_code =3D errno;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(fd);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 unlink(image_path);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cleanup(NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_printerr(&quot;Failed to truncate file =
%s to %u MB: %s\n&quot;, image_path,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UNIFO=
RM_FLASH_SIZE, strerror(error_code));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(EXIT_FAILURE);<br>
diff --git a/tests/qtest/qmp-test.c b/tests/qtest/qmp-test.c<br>
index bf7304c7dc..0fa00c12dc 100644<br>
--- a/tests/qtest/qmp-test.c<br>
+++ b/tests/qtest/qmp-test.c<br>
@@ -161,12 +161,13 @@ static void test_qmp_protocol(void)<br>
<br>
=C2=A0/* Out-of-band tests */<br>
<br>
-char tmpdir[] =3D &quot;/tmp/qmp-test-XXXXXX&quot;;<br>
+char *tmpdir;<br>
=C2=A0char *fifo_name;<br>
<br>
=C2=A0static void setup_blocking_cmd(void)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 if (!g_mkdtemp(tmpdir)) {<br>
+=C2=A0 =C2=A0 tmpdir =3D g_dir_make_tmp(&quot;qmp-test-XXXXXX&quot;, NULL)=
;<br>
+=C2=A0 =C2=A0 if (!tmpdir) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_error(&quot;g_mkdtemp: %s&quot;, strerr=
or(errno));<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0fifo_name =3D g_strdup_printf(&quot;%s/fifo&quot;, tmpd=
ir);<br>
@@ -179,6 +180,7 @@ static void cleanup_blocking_cmd(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0unlink(fifo_name);<br>
=C2=A0 =C2=A0 =C2=A0rmdir(tmpdir);<br>
+=C2=A0 =C2=A0 g_free(tmpdir);<br>
=C2=A0}<br>
<br>
=C2=A0static void send_cmd_that_blocks(QTestState *s, const char *id)<br>
diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk=
-test.c<br>
index a81c2a2715..07a4c2d500 100644<br>
--- a/tests/qtest/vhost-user-blk-test.c<br>
+++ b/tests/qtest/vhost-user-blk-test.c<br>
@@ -841,7 +841,8 @@ static char *create_listen_socket(int *fd)<br>
=C2=A0 =C2=A0 =C2=A0char *path;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* No race because our pid makes the path unique */<br>
-=C2=A0 =C2=A0 path =3D g_strdup_printf(&quot;/tmp/qtest-%d-sock.XXXXXX&quo=
t;, getpid());<br>
+=C2=A0 =C2=A0 path =3D g_strdup_printf(&quot;%s/qtest-%d-sock.XXXXXX&quot;=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0g_get_tmp_dir(), getpid());<br>
=C2=A0 =C2=A0 =C2=A0tmp_fd =3D mkstemp(path);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(tmp_fd, &gt;=3D, 0);<br>
=C2=A0 =C2=A0 =C2=A0close(tmp_fd);<br>
diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c<=
br>
index d7d6cfc9bd..4e1aae1794 100644<br>
--- a/tests/qtest/vhost-user-test.c<br>
+++ b/tests/qtest/vhost-user-test.c<br>
@@ -482,8 +482,7 @@ static TestServer *test_server_new(const gchar *name,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct vhost_user_ops *ops)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0TestServer *server =3D g_new0(TestServer, 1);<br>
-=C2=A0 =C2=A0 char template[] =3D &quot;/tmp/vhost-test-XXXXXX&quot;;<br>
-=C2=A0 =C2=A0 const char *tmpfs;<br>
+=C2=A0 =C2=A0 g_autofree const char *tmpfs;<br>
<br>
=C2=A0 =C2=A0 =C2=A0server-&gt;context =3D g_main_context_new();<br>
=C2=A0 =C2=A0 =C2=A0server-&gt;loop =3D g_main_loop_new(server-&gt;context,=
 FALSE);<br>
@@ -491,9 +490,10 @@ static TestServer *test_server_new(const gchar *name,<=
br>
=C2=A0 =C2=A0 =C2=A0/* run the main loop thread so the chardev may operate =
*/<br>
=C2=A0 =C2=A0 =C2=A0server-&gt;thread =3D g_thread_new(NULL, thread_functio=
n, server-&gt;loop);<br>
<br>
-=C2=A0 =C2=A0 tmpfs =3D g_mkdtemp(template);<br>
+=C2=A0 =C2=A0 tmpfs =3D g_dir_make_tmp(&quot;vhost-test-XXXXXX&quot;, NULL=
);<br>
=C2=A0 =C2=A0 =C2=A0if (!tmpfs) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_test_message(&quot;g_mkdtemp on path (%s): %=
s&quot;, template, strerror(errno));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_test_message(&quot;g_dir_make_tmp on path (%=
s): %s&quot;, tmpfs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0strerror(errno));<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0g_assert(tmpfs);<br>
<br>
diff --git a/tests/qtest/virtio-blk-test.c b/tests/qtest/virtio-blk-test.c<=
br>
index dc5eed31c8..19c01f808b 100644<br>
--- a/tests/qtest/virtio-blk-test.c<br>
+++ b/tests/qtest/virtio-blk-test.c<br>
@@ -49,10 +49,10 @@ static void drive_destroy(void *path)<br>
=C2=A0static char *drive_create(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int fd, ret;<br>
-=C2=A0 =C2=A0 char *t_path =3D g_strdup(&quot;/tmp/qtest.XXXXXX&quot;);<br=
>
+=C2=A0 =C2=A0 char *t_path;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Create a temporary raw image */<br>
-=C2=A0 =C2=A0 fd =3D mkstemp(t_path);<br>
+=C2=A0 =C2=A0 fd =3D g_file_open_tmp(&quot;qtest.XXXXXX&quot;, &amp;t_path=
, NULL);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(fd, &gt;=3D, 0);<br>
=C2=A0 =C2=A0 =C2=A0ret =3D ftruncate(fd, TEST_IMAGE_SIZE);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(ret, =3D=3D, 0);<br>
diff --git a/tests/qtest/virtio-scsi-test.c b/tests/qtest/virtio-scsi-test.=
c<br>
index 8ceb12aacd..073a89d535 100644<br>
--- a/tests/qtest/virtio-scsi-test.c<br>
+++ b/tests/qtest/virtio-scsi-test.c<br>
@@ -268,7 +268,7 @@ static void test_iothread_attach_node(void *obj, void *=
data,<br>
=C2=A0 =C2=A0 =C2=A0QVirtioSCSIPCI *scsi_pci =3D obj;<br>
=C2=A0 =C2=A0 =C2=A0QVirtioSCSI *scsi =3D &amp;scsi_pci-&gt;scsi;<br>
=C2=A0 =C2=A0 =C2=A0QVirtioSCSIQueues *vs;<br>
-=C2=A0 =C2=A0 char tmp_path[] =3D &quot;/tmp/qtest.XXXXXX&quot;;<br>
+=C2=A0 =C2=A0 g_autofree char *tmp_path;<br>
=C2=A0 =C2=A0 =C2=A0int fd;<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
@@ -282,7 +282,7 @@ static void test_iothread_attach_node(void *obj, void *=
data,<br>
=C2=A0 =C2=A0 =C2=A0vs =3D qvirtio_scsi_init(scsi-&gt;vdev);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Create a temporary qcow2 overlay*/<br>
-=C2=A0 =C2=A0 fd =3D mkstemp(tmp_path);<br>
+=C2=A0 =C2=A0 fd =3D g_file_open_tmp(&quot;qtest.XXXXXX&quot;, &amp;tmp_pa=
th, NULL);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(fd &gt;=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0close(fd);<br>
<br>
diff --git a/tests/unit/test-image-locking.c b/tests/unit/test-image-lockin=
g.c<br>
index ba057bd66c..d09ff43fcb 100644<br>
--- a/tests/unit/test-image-locking.c<br>
+++ b/tests/unit/test-image-locking.c<br>
@@ -76,10 +76,10 @@ static void check_locked_bytes(int fd, uint64_t perm_lo=
cks,<br>
=C2=A0static void test_image_locking_basic(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0BlockBackend *blk1, *blk2, *blk3;<br>
-=C2=A0 =C2=A0 char img_path[] =3D &quot;/tmp/qtest.XXXXXX&quot;;<br>
+=C2=A0 =C2=A0 g_autofree char *img_path;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t perm, shared_perm;<br>
<br>
-=C2=A0 =C2=A0 int fd =3D mkstemp(img_path);<br>
+=C2=A0 =C2=A0 int fd =3D g_file_open_tmp(&quot;qtest.XXXXXX&quot;, &amp;im=
g_path, NULL);<br>
=C2=A0 =C2=A0 =C2=A0assert(fd &gt;=3D 0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0perm =3D BLK_PERM_WRITE | BLK_PERM_CONSISTENT_READ;<br>
@@ -117,10 +117,10 @@ static void test_image_locking_basic(void)<br>
=C2=A0static void test_set_perm_abort(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0BlockBackend *blk1, *blk2;<br>
-=C2=A0 =C2=A0 char img_path[] =3D &quot;/tmp/qtest.XXXXXX&quot;;<br>
+=C2=A0 =C2=A0 g_autofree char *img_path;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t perm, shared_perm;<br>
=C2=A0 =C2=A0 =C2=A0int r;<br>
-=C2=A0 =C2=A0 int fd =3D mkstemp(img_path);<br>
+=C2=A0 =C2=A0 int fd =3D g_file_open_tmp(&quot;qtest.XXXXXX&quot;, &amp;im=
g_path, NULL);<br>
=C2=A0 =C2=A0 =C2=A0assert(fd &gt;=3D 0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0perm =3D BLK_PERM_WRITE | BLK_PERM_CONSISTENT_READ;<br>
diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c<br>
index a05a4628ed..b73d231cd5 100644<br>
--- a/tests/unit/test-qga.c<br>
+++ b/tests/unit/test-qga.c<br>
@@ -59,7 +59,7 @@ fixture_setup(TestFixture *fixture, gconstpointer data, g=
char **envp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0fixture-&gt;loop =3D g_main_loop_new(NULL, FALSE);<br>
<br>
-=C2=A0 =C2=A0 fixture-&gt;test_dir =3D g_strdup(&quot;/tmp/qgatest.XXXXXX&=
quot;);<br>
+=C2=A0 =C2=A0 fixture-&gt;test_dir =3D g_strdup_printf(&quot;%s/qgatest.XX=
XXXX&quot;, g_get_tmp_dir());<br>
=C2=A0 =C2=A0 =C2=A0g_assert_nonnull(g_mkdtemp(fixture-&gt;test_dir));<br>
<br>
=C2=A0 =C2=A0 =C2=A0path =3D g_build_filename(fixture-&gt;test_dir, &quot;s=
ock&quot;, NULL);<br>
diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c<br>
index 9b1dab2f28..fecdf915e7 100644<br>
--- a/tests/vhost-user-bridge.c<br>
+++ b/tests/vhost-user-bridge.c<br>
@@ -631,7 +631,6 @@ static void *notifier_thread(void *arg)<br>
=C2=A0static void<br>
=C2=A0vubr_host_notifier_setup(VubrDev *dev)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 char template[] =3D &quot;/tmp/vubr-XXXXXX&quot;;<br>
=C2=A0 =C2=A0 =C2=A0pthread_t thread;<br>
=C2=A0 =C2=A0 =C2=A0size_t length;<br>
=C2=A0 =C2=A0 =C2=A0void *addr;<br>
@@ -639,7 +638,7 @@ vubr_host_notifier_setup(VubrDev *dev)<br>
<br>
=C2=A0 =C2=A0 =C2=A0length =3D qemu_real_host_page_size() * VHOST_USER_BRID=
GE_MAX_QUEUES;<br>
<br>
-=C2=A0 =C2=A0 fd =3D mkstemp(template);<br>
+=C2=A0 =C2=A0 fd =3D g_file_open_tmp(&quot;vubr-XXXXXX&quot;, NULL, NULL);=
<br>
=C2=A0 =C2=A0 =C2=A0if (fd &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vubr_die(&quot;mkstemp()&quot;);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000e7a73405e94952d9--

