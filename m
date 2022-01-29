Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DE44A2F75
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 13:36:36 +0100 (CET)
Received: from localhost ([::1]:39566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDmy2-0008DJ-Qu
	for lists+qemu-devel@lfdr.de; Sat, 29 Jan 2022 07:36:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nDmvf-0005fG-1O
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 07:34:08 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:57167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nDmvc-000135-Qz
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 07:34:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=ViFsQGWBdHTPpb8VUXvh/NcFNxUsKedtcUazmX9HS9w=; b=jNzbGwrH6/7QIjmdlk7hDsSc4m
 yQxUjQBsL/Ox5+VJ98ZywQSkWtTfP8/Dn0N0VHnGRsX3WSAElRGn6QsY6ltd+0Hxm8ogGNZRR1pIS
 PyG5G2sa9/LfhkbU6nFg14bwMv3kWDMU70IEs7WIUCHXbbW6qRUtEMbQvkjoTK4M+ciVIMAm3+b32
 4EUVpjqrzf8S27A2frXvc5IaBeEav25a0h1CM7vQmFXGihKNVmACdNWfQhhGSfdapC+xji4+fwMTX
 822Q8OU+rf23gUfGYa4FfOV+48qArBxEL/Zl9Nlr1qFLJLqCwMsYhIvAFthhvkjjkkWBxers8v0Jj
 3Hw2hUU83fgK2dlu+tia+ZHuAuPMlcZq3gRUG2N8SO1Mr68Kq9+UR19zlyEpyMR/V6ugqeY/Ik3jK
 y1Fp/SjR9bTTn6zueCyJNeQt2xbnWv8N/mhL9U9QLFW+bdQiN+TUwIewKhNb66fVTYLy/JTTXm9bA
 ZWCOB1RPKwVamM7EFc0jKqp7wHfriEDlWFbVS0yK0LQUtGN/8Oemhe6eCi36aZVQM8HfV++1Cu/9S
 Wl96Cz5wuwNvPCum9y/gTY/+ge77vORMmCviqWqvBBv9mUhT4TPI0+s16UC2m8zyooUzbhrGGCDWU
 B5ZyeG8aXN3G01XxmC6xi9vyPdUarDH+hpbNNpBmM=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/9pfs: Use g_autofree and g_autoptr where possible
Date: Sat, 29 Jan 2022 13:33:59 +0100
Message-ID: <4981516.0zRxyBk1fS@silver>
In-Reply-To: <2336064.2jqZdHoEpY@silver>
References: <20220126171136.672657-1-groug@kaod.org>
 <2336064.2jqZdHoEpY@silver>
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

On Freitag, 28. Januar 2022 12:49:58 CET Christian Schoenebeck wrote:
> On Mittwoch, 26. Januar 2022 18:11:36 CET Greg Kurz wrote:
> > The template pointer in virtio_9p_create_local_test_dir() is leaked.
> > Add the g_autofree annotation to fix that. While here, convert the
> > rest of the virtio 9p test code to using g_autofree or g_autoptr
> > where possible, since this is the preferred approach to avoid potential
> > leaks in the future.
> > 
> > Based-on:
> > <f6602123c6f7d0d593466231b04fba087817abbd.1642879848.git.qemu_oss@crudebyt
> > e
> > .com> Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> > 
> >  tests/qtest/libqos/virtio-9p.c | 15 +++++----------
> >  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> I fear there is something wrong with this patch:
> 
> # Start of local tests
> # starting QEMU: exec x86_64-softmmu/qemu-system-x86_64 -qtest
> unix:/tmp/qtest-4234.sock -qtest-log /dev/null -chardev
> socket,path=/tmp/qtest-4234.qmp,id=char0 -mon chardev=char0,mode=control
> -display none -M pc  -fsdev
> local,id=fsdev0,path='',security_model=mapped-xattr -device
> virtio-9p-pci,fsdev=fsdev0,addr=04.0,mount_tag=qtest -accel qtest
> qemu-system-x86_64: -device
> virtio-9p-pci,fsdev=fsdev0,addr=04.0,mount_tag=qtest: cannot initialize
> fsdev 'fsdev0': failed to open '': No such file or directory Broken pipe
> Aborted

Reason ...

> > diff --git a/tests/qtest/libqos/virtio-9p.c
> > b/tests/qtest/libqos/virtio-9p.c index ef96ef006adc..0a0d0d16709b 100644
> > --- a/tests/qtest/libqos/virtio-9p.c
> > +++ b/tests/qtest/libqos/virtio-9p.c
> > @@ -40,14 +40,13 @@ static char *concat_path(const char* a, const char* b)
> > 
> >  void virtio_9p_create_local_test_dir(void)
> >  {
> >  
> >      struct stat st;
> > 
> > -    char *pwd = g_get_current_dir();
> > -    char *template = concat_path(pwd, "qtest-9p-local-XXXXXX");
> > +    g_autofree char *pwd = g_get_current_dir();
> > +    g_autofree char *template = concat_path(pwd,
> > "qtest-9p-local-XXXXXX");
> > 
> >      local_test_path = mkdtemp(template);

... mkdtemp() does not allocate a new buffer, it just modifies the character 
array passed, i.e. the address returned by mkdtemp() equals the address of 
variable 'template', and when virtio_9p_create_local_test_dir() scope is left, 
the global variable 'local_test_path' would then point to freed memory.

I would drop g_autofree from template:

    char *template = concat_path(pwd, "qtest-9p-local-XXXXXX");

And if it helps to silence a leak warning (haven't tested), to prepend 
g_autofree to the global variable instead:

static g_autofree char *local_test_path;

Best regards,
Christian Schoenebeck



