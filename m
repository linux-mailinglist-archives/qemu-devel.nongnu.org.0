Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A604B58F1
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 18:44:57 +0100 (CET)
Received: from localhost ([::1]:46996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJfPD-0002As-Uw
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 12:44:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nJfL4-000094-MH
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 12:40:40 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:40387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nJfL1-0002f7-EO
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 12:40:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=UaL7G3ifBj7Nsxmpxjlku4H9ImmsjXKcceZ9h+SRz6k=; b=uVSLKovYXKXPOQM+CwN7vLohgn
 bMiz0kXgR/ckpXdWiVExayY0UejP5HUBIX46AIxxqLg99aUhL58Llv0mP2HMChw6byq0VpNO+wTPI
 Ayk2q9flzgvMLvsPqJv6IQISrF/qRcejBS6Nl02Kogm+XOWbJrK+4GsJmoE2nwmNs5nSVhVWvR1Fc
 hTlCY2GzLt73zZk90LvsU4fvzdEv8CRAzjd1ALwHLiji+GySu2n0RVTEUlL/WlzuZEbj+cKgqoNpB
 E5xH/kWKpVDtIKhmMl4pvA4cI/Wh6Mz7ZygF4Gbe+5tV3P6u/3TifDIXiyMGqZYgRMnqd3qBfLKPs
 DcViJn6j9fqjZi/y4joP81B5nIOiaXCiK1t4aWO89pg2/FOc5VijXyc0/f70ziJvPjLL2ZdwjjqaS
 AusI5OICpOs77ecFrMBOmdibPe+oUW0rUXlwGY8p3Tmv//svCukESw+P2wzfzN0e4e8fWaZrz0Ho2
 Zp0BXoTVAwsqmV/fIJnMRu6kpZNf8WT0g+bZz1Sdyvxv4UjrluuzFHRlsNSRaDF+VT8g+GMEAkPi7
 l/r0TxnLH/3mKtgQYQh7Y3cbnjrF9lHbY3IAOSKuyw8EpoxEISnkSbDivp46X3/K5xnDY2B8/2Wzt
 w9nKNK5oz7a+A2wbv508oCjT050g9PJyvnBP6v1ZI=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Vitaly Chikunov <vt@altlinux.org>, Peter Maydell <peter.maydell@linaro.org>,
 "Dmitry V . Levin" <ldv@altlinux.org>, Greg Kurz <groug@kaod.org>
Subject: Re: [PULL 0/5] 9p queue 2022-02-10
Date: Mon, 14 Feb 2022 18:40:31 +0100
Message-ID: <1862027.zFXIqjshya@silver>
In-Reply-To: <20220214144351.dp57o6jyfvliwkos@altlinux.org>
References: <cover.1644492115.git.qemu_oss@crudebyte.com>
 <2442070.WHyy189egQ@silver> <20220214144351.dp57o6jyfvliwkos@altlinux.org>
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

On Montag, 14. Februar 2022 15:43:51 CET Vitaly Chikunov wrote:
> Christian,
> 
> On Mon, Feb 14, 2022 at 12:44:48PM +0100, Christian Schoenebeck wrote:
> > On Montag, 14. Februar 2022 11:36:53 CET Greg Kurz wrote:
> > > The synth backend should be fixed to honor d_reclen, or
> > > at least to allocate with g_new0().
> > 
> > Yes, I overlooked that this is not initialized with zero already.
> > 
> > With g_new0() d_reclen would be zero and qemu_dirent_dup() would then
> > fallback
> > to the portable branch (as I assumed it already would):
> Perhaps, this additional change should be added (I only found two instances
> of V9fsSynthOpenState allocation):
> 
> diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
> --- a/hw/9pfs/9p-synth.c
> +++ b/hw/9pfs/9p-synth.c
> @@ -182,7 +182,7 @@ static int synth_opendir(FsContext *ctx,
>      V9fsSynthOpenState *synth_open;
>      V9fsSynthNode *node = *(V9fsSynthNode **)fs_path->data;
> 
> -    synth_open = g_malloc(sizeof(*synth_open));
> +    synth_open = g_malloc0(sizeof(*synth_open));
>      synth_open->node = node;
>      node->open_count++;
>      fs->private = synth_open;
> @@ -266,7 +266,7 @@ static int synth_open(FsContext *ctx, V9fsPath *fs_path,
> V9fsSynthOpenState *synth_open;
>      V9fsSynthNode *node = *(V9fsSynthNode **)fs_path->data;
> 
> -    synth_open = g_malloc(sizeof(*synth_open));
> +    synth_open = g_malloc0(sizeof(*synth_open));
>      synth_open->node = node;
>      node->open_count++;
>      fs->private = synth_open;

Either

   /*
    * Add NAME_MAX to ensure there is enough space for 'dent' member, because
    * some systems have d_name size of just 1, which would cause a buffer
    * overrun.
    */
	synth_open = g_malloc0(sizeof(*synth_open) + NAME_MAX);

Or more simple by adjusting struct V9fsSynthOpenState:

index 036d7e4a5b..eeb246f377 100644
--- a/hw/9pfs/9p-synth.h
+++ b/hw/9pfs/9p-synth.h
@@ -41,6 +41,11 @@ typedef struct V9fsSynthOpenState {
     off_t offset;
     V9fsSynthNode *node;
     struct dirent dent;
+    /*
+     * Ensure there is enough space for 'dent' above, some systems have a
+     * d_name size of just 1, which would cause a buffer overrun.
+     */
+    char dent_trailing_space[NAME_MAX];
 } V9fsSynthOpenState;
 
 int qemu_v9fs_synth_mkdir(V9fsSynthNode *parent, int mode,

and of course still replacing g_malloc() by g_malloc0().

> > Additionally I would add NAME_MAX to the V9fsSynthOpenState allocation
> > size, because it is known that some systems define dirent as flex-array
> > (zero d_name size).
> 
> (To be precise) not just zero, but 1 byte. Also, to remind, for some
> filesystems, such as CIFS, actual d_name size could be longer than NAME_MAX.
> Because of that struct dirent cannot be allocated statically or with simple
> sizeof.

Yes, but the dir names in the synth driver are just short hard coded names
anyway, there is no access to a real filesystem going on in the synth driver. 

> > I know Greg would not favour this solution (using g_new0), but it's the
> > most minimalistic and most portable solution. So I would favour it for
> > now.
> Why g_new0 and not just g_malloc0? This is smallest code change, which seems
> appropriate for a bug fix.

Both are fine with me in this case.

> 
> Thanks,
> 
> > A cleaner solution on the long-term would be turning V9fsSynthOpenState's
> > 'dent' member into a pointer and adding a new function to osdep like:
> > 
> > struct dirent *
> > qemu_dirent_new(const char* name) {
> > 
> >     ...
> > 
> > }
> > 
> > But I would like to postpone that qemu_dirent_new() solution, e.g. because
> > I guess some people would probably not like qemu_dirent_new() to have in
> > osdep, as it is probably not a general purpose function, and I am not
> > keen putting qemu_dirent_new() into a different location than
> > qemu_dirent_dup(), because it would raise the danger that system
> > dependent code might deviate in future.
> > 
> > Best regards,
> > Christian Schoenebeck



