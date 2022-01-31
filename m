Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7254C4A47CE
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 14:11:09 +0100 (CET)
Received: from localhost ([::1]:42614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEWSa-000402-Gq
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 08:11:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nEVw3-0006ER-54
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 07:37:31 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:58701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nEVvz-0002bL-Oy
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 07:37:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=ZP1fWnjQMhhGTfwdYyMlBxb1H7XWT6KI5BwpKGUiWv8=; b=jM5SgEsIVr+VOo2nUi0pnStvC0
 7dk4JzyiqTnvDpVqEfyeJKUg1N0VH4k8iDnuo/8ejLFpR1U2fQVqupiWwfUp+ThxjJD/8w75TBWDU
 oXLqMfxv9zFK71ikfXP6hXvNKMdoSMn+UJ2ngBk3+8amFKN8lf1E1aOo+28gYk6nYhiHXC27TdmLE
 xXBDM58hbRjQo73FrDXg4pazTZMjjNleKk9iDAGTtcaTpV/rQ2d7E1EYnUPSpqLRKiO7N/mUZ/EWF
 lsTP3kyQm//s9QOmYllFcALggzXZ1tDdMCroH3xRUXGFgM5q5hO9LLnPqh6gkJ2mpCFTKdeWoBtdL
 O9tVcVwhx0Z1n12CA5Y8lwBwbd/thqJ+AKDxpCsIKAi436w7Ecng1ovWwxGlkEHmBsH/pF5TLiV4N
 aJO0HERqbVoOOSGCUzFGrH5PPhiVFiqiRxBhmzK4505AGq5tE1tHdQ/1a7p1PxWVvMUUGKmDVvHx/
 w7L7ddJWHQOxi+SulbNJBrM5M6n+LUxeFKKoA8X7e7COhT3B3PObyC69x4pbzPDRZgRuxIKlpGpwY
 5g2/Fj1Q6xfSUpe7MAVAol8g/J6qUW8IQsZ5sEYTOUna+MxlAUS/Ks5vekGF5JTd8S7FN/F0QLZuK
 WVcHefAuE8YHzI9anMQYxqEWXOWs0cxvqxhCtVg5U=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/9pfs: Use g_autofree and g_autoptr where possible
Date: Mon, 31 Jan 2022 13:37:23 +0100
Message-ID: <8838481.laWMekmXc4@silver>
In-Reply-To: <20220131083524.4a5d5a8d@bahia>
References: <20220126171136.672657-1-groug@kaod.org>
 <4981516.0zRxyBk1fS@silver> <20220131083524.4a5d5a8d@bahia>
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

On Montag, 31. Januar 2022 08:35:24 CET Greg Kurz wrote:
> > > > diff --git a/tests/qtest/libqos/virtio-9p.c
> > > > b/tests/qtest/libqos/virtio-9p.c index ef96ef006adc..0a0d0d16709b
> > > > 100644
> > > > --- a/tests/qtest/libqos/virtio-9p.c
> > > > +++ b/tests/qtest/libqos/virtio-9p.c
> > > > @@ -40,14 +40,13 @@ static char *concat_path(const char* a, const
> > > > char* b)
> > > > 
> > > >  void virtio_9p_create_local_test_dir(void)
> > > >  {
> > > >  
> > > >      struct stat st;
> > > > 
> > > > -    char *pwd = g_get_current_dir();
> > > > -    char *template = concat_path(pwd, "qtest-9p-local-XXXXXX");
> > > > +    g_autofree char *pwd = g_get_current_dir();
> > > > +    g_autofree char *template = concat_path(pwd,
> > > > "qtest-9p-local-XXXXXX");
> > > > 
> > > >      local_test_path = mkdtemp(template);
> > 
> > ... mkdtemp() does not allocate a new buffer, it just modifies the
> > character array passed, i.e. the address returned by mkdtemp() equals the
> > address of variable 'template', and when
> > virtio_9p_create_local_test_dir() scope is left, the global variable
> > 'local_test_path' would then point to freed memory.
> I hate global variables ;-) and the 'Returned result must be freed' comment
> in 'concat_path()' is slightly misleading in this respect.

About the global variable: sure, I am not happy about it either. What I
disliked even more is that virtio_9p_create_local_test_dir() is called from a
constructor, but as I described in [1] I did not find a realiable alternative.
If somebody comes up with a working and reliable, clean alternative, very much
appreciated!

About the concat_path() comment: I don't understand what's supposed to be
misleading about the comment, concat_path() is just a one-liner utility
function:

/* Concatenates the passed 2 pathes. Returned result must be freed. */
static char *concat_path(const char* a, const char* b)
{
    return g_build_filename(a, b, NULL);
}

So all the comment sais is that the function allocates memory that it does not
free on it its own. The called glib function sais this [2]:

    "A newly-allocated string that must be freed with g_free()."

[1] https://github.com/qemu/qemu/commit/136b7af22774a6f0fb44c9c1b8c088b52e2e92ed
[2] https://docs.gtk.org/glib/func.build_filename.html

> 
> > I would drop g_autofree from template:
> >     char *template = concat_path(pwd, "qtest-9p-local-XXXXXX");
> > 
> > And if it helps to silence a leak warning (haven't tested), to prepend
> > g_autofree to the global variable instead:
> > 
> > static g_autofree char *local_test_path;
> 
> The way to go is either drop the g_autofree annotation as you're
> suggesting, but this would make the comment in 'concat_path()'
> even more awkward, or go forward with the glib way and use
> g_steal_pointer() which maps exactly to what the code is doing.

I am fine either way, as long as the resulting behaviour works.

Best regards,
Christian Schoenebeck



