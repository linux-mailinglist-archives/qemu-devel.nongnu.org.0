Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BC8287799
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Oct 2020 17:38:55 +0200 (CEST)
Received: from localhost ([::1]:44504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQY0M-0004vf-E5
	for lists+qemu-devel@lfdr.de; Thu, 08 Oct 2020 11:38:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kQXwZ-0002Qv-Nj
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 11:34:59 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:39765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kQXwX-0008TO-Of
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 11:34:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=8L0VymRe7eL/gjDwLMl6xE3ajlTXdcui9vvd3+1IVks=; b=OVp7bHABVXQvM60DIxVrkpSDdF
 I1jY1G0JUNpCiuUikzKgmdrjyBp3Nmsl8Js0og8TVBioEG4dVvSSaQHmkcQHHJfPRlB+fF0GbMezZ
 lf82Ii1TolfthOeZV2zGC1LfVYbXkXV63C9HWFPRWAvlVIKcS8lTgMlKJbwlXYvs9zSjPOPG+9xS4
 6hGrciOCbgsQ/JsjYwRgJeuPyeTo7su7f/CL19CMrWnPqHT6iGuRKnhqr+Wq32X2O4QC5QDSnFJKY
 JhgsoMOHktxaMYX0TqNZJnW6XuLn5VYIcnLD0yDQqJ5j94kpta2oyZdxiTeSX1vOEw2EBXz5InAwl
 tx+CFg4A==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 Greg Kurz <groug@kaod.org>, berrange@redhat.com
Subject: Re: [PATCH v3 09/11] tests/9pfs: wipe local 9pfs test directory
Date: Thu, 08 Oct 2020 17:34:54 +0200
Message-ID: <1992016.PhV0Fcqi1k@silver>
In-Reply-To: <10015241.kaXt91Qapa@silver>
References: <cover.1601655308.git.qemu_oss@crudebyte.com>
 <0c54a2ca2049e9824df9805324cac8dac029c113.1601655308.git.qemu_oss@crudebyte.com>
 <10015241.kaXt91Qapa@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/08 08:26:30
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

On Donnerstag, 8. Oktober 2020 14:26:28 CEST Christian Schoenebeck wrote:
> On Freitag, 2. Oktober 2020 18:15:05 CEST Christian Schoenebeck wrote:
> > Before running the first 9pfs test case, make sure the test directory
> > for running the 9pfs 'local' tests on is entirely empty. For that
> > reason simply delete the test directory (if any) before (re)creating
> > it on test suite startup.
> > 
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> > 
> >  tests/qtest/libqos/virtio-9p.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/tests/qtest/libqos/virtio-9p.c
> > b/tests/qtest/libqos/virtio-9p.c index 1bada47af1..41a7c2baaa 100644
> > --- a/tests/qtest/libqos/virtio-9p.c
> > +++ b/tests/qtest/libqos/virtio-9p.c
> > @@ -53,6 +53,18 @@ static void create_local_test_dir(void)
> > 
> >      g_assert((st.st_mode & S_IFMT) == S_IFDIR);
> >  
> >  }
> > 
> > +/* Deletes directory previously created by create_local_test_dir(). */
> > +static void remove_local_test_dir(void)
> > +{
> > +    g_assert(local_test_path != NULL);
> > +    char *cmd = g_strdup_printf("rm -r '%s'\n", local_test_path);
> > +    int res = system(cmd);
> > +    if (res < 0) {
> > +        /* ignore error, dummy check to prevent compiler error */
> > +    }
> > +    g_free(cmd);
> > +}
> > +
> > 
> >  static void virtio_9p_cleanup(QVirtio9P *interface)
> >  {
> >  
> >      qvirtqueue_cleanup(interface->vdev->bus, interface->vq, alloc);
> > 
> > @@ -220,6 +232,7 @@ static void virtio_9p_register_nodes(void)
> > 
> >      /* make sure test dir for the 'local' tests exists and is clean */
> >      init_local_test_path();
> > 
> > +    remove_local_test_dir();
> > 
> >      create_local_test_dir();
> >      
> >      QPCIAddress addr = {
> >      
> >          .devfn = QPCI_DEVFN(4, 0),
> >      
> >      };
> >      
> >      QOSGraphEdgeOptions opts = {
> >      
> >          .before_cmd_line = "-fsdev synth,id=fsdev0",
> >      
> >      };
> >      
> >      /* virtio-9p-device */
> >      opts.extra_device_opts = str_simple,
> >      qos_node_create_driver("virtio-9p-device", virtio_9p_device_create);
> >      qos_node_consumes("virtio-9p-device", "virtio-bus", &opts);
> >      qos_node_produces("virtio-9p-device", "virtio");
> >      qos_node_produces("virtio-9p-device", "virtio-9p");
> >      
> >      /* virtio-9p-pci */
> >      opts.extra_device_opts = str_addr;
> >      add_qpci_address(&opts, &addr);
> >      qos_node_create_driver("virtio-9p-pci", virtio_9p_pci_create);
> >      qos_node_consumes("virtio-9p-pci", "pci-bus", &opts);
> >      qos_node_produces("virtio-9p-pci", "pci-device");
> >      qos_node_produces("virtio-9p-pci", "virtio");
> >      qos_node_produces("virtio-9p-pci", "virtio-9p");
> > 
> > }
> > 
> > libqos_init(virtio_9p_register_nodes);
> 
> I wonder why libqos is calling virtio_9p_register_nodes() again after all
> qtests ended.
> 
> That's somewhat suboptimal here, as it causes remove_local_test_dir() to be
> called again after all qtests completed. My intention was actually only to
> wipe the "qtest-9p-local" test directory at the *start* of the test suite
> run. Not at the end of the test suite. Because it would allow developers to
> look at the actual dirs/files created after the tests completed.
> 
> I could of course misuse and add a dedicated "wipedir" test as workaround,
> but that OTOH would break the option of running individual tests with the
> -p CL switch.

I probably leave that issue unfixed for now.

There seems to be no easy way to fix this, as libqos does not having something 
like "run this function once per test suite run", and due to the multi process 
approach a static variable hack would not be viable either.

Fortunately though, if a test case fails virtio_9p_register_nodes() would not 
be called again, so at least in case of failures the test dir is note wiped.

So I don't think it's worth to drill another hole into libqos just for this.

Best regards,
Christian Schoenebeck



