Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B284A4C59
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 17:42:33 +0100 (CET)
Received: from localhost ([::1]:60554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEZlA-0006AY-Qi
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 11:42:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nEZO2-0003Bn-RL
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 11:18:38 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:41775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nEZO0-0007gd-E2
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 11:18:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=bMminvCdihyBEuCIzA+pIn1EoSMT1I1hGwBP5zDSwjo=; b=q9Xhh8vdzwIG2HkhiHS1JIWkHT
 0ckIjgjjPBfrdBst6nsTUtWBGVvAYjb6P4J7FP6cITZV6kdpoibmp8L8VGs718NkgRe+TQGtdEilf
 y2iBcljckNIunmctsvOAZpXTTU7D6vQu/pxZa2njMFqCgpzx97yyxScH00alijOs4MEsbkI4hE7m3
 8nXRlttet9IxgsIt3yhil9gQisDruhT1GtqD+Tl3To5zt240l1sGVmIgTTTau9vC1N9SpwQahOaAp
 idRoO9hY5hAKmO0WUVgfyaOW2KwvtwbR6hZ4w0oZ/4QK8EdHiAj/7lFiW1PWLErxNKDDwK7sE0nv8
 2zttqSDavhDWQLmFqc6yqb2C5Q9djtLDE5GjSsKQeQYMuZe6lSzm1Oghf/ZbRxM0tXjtLTKiPzqd+
 oFOd4FecYk6rxcyljhhIFMM8TNKZknAk/bz2BzdOOZg94ngV9hnwKsNHh+IhIqiUnhQK6+0nUMeAL
 nL1mZVU/QSQbxi2cpzQ7Lc/EyD74u7xKGJGHVTciVGD+cZ5Qrd7W25wHaLtJyDqaY6Xrt9lB/xQz6
 dnXu8HeWzpMaoJbCq0toE2jkcJh2i5tHq6lfnzqC9jdg8vyH/WLLnaWe2kiXIGFAI8D7HCcNhwMkH
 /tQrTgHUUc8umevmPO9s8EeCMUhtZC4Wl9fdIl3UU=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/9pfs: Use g_autofree and g_autoptr where possible
Date: Mon, 31 Jan 2022 17:18:33 +0100
Message-ID: <6421822.Trfd2Djtnt@silver>
In-Reply-To: <20220131170907.3a85de94@bahia>
References: <20220126171136.672657-1-groug@kaod.org>
 <2777753.eeY9lOXx2E@silver> <20220131170907.3a85de94@bahia>
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

On Montag, 31. Januar 2022 17:09:07 CET Greg Kurz wrote:
> On Mon, 31 Jan 2022 16:12:45 +0100
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Montag, 31. Januar 2022 15:44:46 CET Greg Kurz wrote:
> > > On Mon, 31 Jan 2022 13:37:23 +0100
> > > 
> > > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > > On Montag, 31. Januar 2022 08:35:24 CET Greg Kurz wrote:
> > > > > > > > diff --git a/tests/qtest/libqos/virtio-9p.c
> > > > > > > > b/tests/qtest/libqos/virtio-9p.c index
> > > > > > > > ef96ef006adc..0a0d0d16709b
> > > > > > > > 100644
> > > > > > > > --- a/tests/qtest/libqos/virtio-9p.c
> > > > > > > > +++ b/tests/qtest/libqos/virtio-9p.c
> > > > > > > > @@ -40,14 +40,13 @@ static char *concat_path(const char* a,
> > > > > > > > const
> > > > > > > > char* b)
> > > > > > > > 
> > > > > > > >  void virtio_9p_create_local_test_dir(void)
> > > > > > > >  {
> > > > > > > >  
> > > > > > > >      struct stat st;
> > > > > > > > 
> > > > > > > > -    char *pwd = g_get_current_dir();
> > > > > > > > -    char *template = concat_path(pwd,
> > > > > > > > "qtest-9p-local-XXXXXX");
> > > > > > > > +    g_autofree char *pwd = g_get_current_dir();
> > > > > > > > +    g_autofree char *template = concat_path(pwd,
> > > > > > > > "qtest-9p-local-XXXXXX");
> > > > > > > > 
> > > > > > > >      local_test_path = mkdtemp(template);
> > > > > > 
> > > > > > ... mkdtemp() does not allocate a new buffer, it just modifies the
> > > > > > character array passed, i.e. the address returned by mkdtemp()
> > > > > > equals
> > > > > > the
> > > > > > address of variable 'template', and when
> > > > > > virtio_9p_create_local_test_dir() scope is left, the global
> > > > > > variable
> > > > > > 'local_test_path' would then point to freed memory.
> > > > > 
> > > > > I hate global variables ;-) and the 'Returned result must be freed'
> > > > > comment
> > > > > in 'concat_path()' is slightly misleading in this respect.
> > > > 
> > > > About the global variable: sure, I am not happy about it either. What
> > > > I
> > > > disliked even more is that virtio_9p_create_local_test_dir() is called
> > > > from a constructor, but as I described in [1] I did not find a
> > > > realiable
> > > > alternative. If somebody comes up with a working and reliable, clean
> > > > alternative, very much appreciated!
> > > 
> > > An alternative might be to create/remove the test directory when
> > > a virtio-9p device is started/destroyed, and keeping the string
> > > under the QVirtio9p structure.
> > 
> > Yeah, I tried that already. Keep in mind it not only has to work
> > sometimes, it has to work reliably, always, for everybody and commit
> > history shows that this can be more hairy than one might think and
> > observe.
> 
> Yeah it is more hairy... the temp directory must be created before the
> device. We could maybe get rid of the constructor by creating the temp
> direcotry in assign_9p_local_driver() since this is the first user. Then we
> still need the destructor to do final cleanup.

I save your time on that: it doesn't work. I tried that as well, plus probably 
a bunch of other options that you haven't considered yet. I even reviewed the 
entire libqos and glib test case code base to find a clean alternative, 
without success.

Best regards,
Christian Schoenebeck



