Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D384F262A2F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 10:26:10 +0200 (CEST)
Received: from localhost ([::1]:35790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFvQf-0003ux-Us
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 04:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kFvOt-00029L-CR
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 04:24:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59781
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kFvOq-0004mD-Js
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 04:24:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599639855;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=tCLCr+tBiub0P1tWsh7toMMuvbdNTOOGLr4OAeC2ZfM=;
 b=Gle9pAANPA1e+NabyQn48XiKPUa6TgR1rN+kTWU3RCkVehsn68SP8RW2WH9Wc3r/B2pyow
 i/G+CPPFAmdr1nBEB1ey1qEzaTQKf6IkM7RoBmNtC0TfzeOl5Xf3Vzh8O5466vSDqc57TU
 S8k9FGTJqmWr+XVNWW6XAVm7HdAcK9w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-66R1xsoUNVSCzVolgcXt9w-1; Wed, 09 Sep 2020 04:24:11 -0400
X-MC-Unique: 66R1xsoUNVSCzVolgcXt9w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05B4E802B62;
 Wed,  9 Sep 2020 08:24:10 +0000 (UTC)
Received: from redhat.com (ovpn-115-8.ams2.redhat.com [10.36.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 059D127BC2;
 Wed,  9 Sep 2020 08:24:00 +0000 (UTC)
Date: Wed, 9 Sep 2020 09:23:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yonggang Luo <luoyonggang@gmail.com>
Subject: Re: [PATCH 07/16] tests: Trying fixes test-replication.c on
 msys2/mingw.
Message-ID: <20200909082358.GG1011023@redhat.com>
References: <20200908194820.702-1-luoyonggang@gmail.com>
 <20200908194820.702-8-luoyonggang@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200908194820.702-8-luoyonggang@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 03:13:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-block@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Max Reitz <mreitz@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>,
 Peter Lieven <pl@kamp.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 09, 2020 at 03:48:11AM +0800, Yonggang Luo wrote:
> On Windows there is no path like /tmp/s_local_disk.XXXXXX
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  tests/test-replication.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/test-replication.c b/tests/test-replication.c
> index 9ab3666a90..cfc1ae6feb 100644
> --- a/tests/test-replication.c
> +++ b/tests/test-replication.c
> @@ -23,14 +23,14 @@
>  
>  /* primary */
>  #define P_ID "primary-id"
> -static char p_local_disk[] = "/tmp/p_local_disk.XXXXXX";
> +static char p_local_disk[PATH_MAX];
>  
>  /* secondary */
>  #define S_ID "secondary-id"
>  #define S_LOCAL_DISK_ID "secondary-local-disk-id"
> -static char s_local_disk[] = "/tmp/s_local_disk.XXXXXX";
> -static char s_active_disk[] = "/tmp/s_active_disk.XXXXXX";
> -static char s_hidden_disk[] = "/tmp/s_hidden_disk.XXXXXX";
> +static char s_local_disk[PATH_MAX];
> +static char s_active_disk[PATH_MAX];
> +static char s_hidden_disk[PATH_MAX];
>  
>  /* FIXME: steal from blockdev.c */
>  QemuOptsList qemu_drive_opts = {
> @@ -571,6 +571,11 @@ static void setup_sigabrt_handler(void)
>  int main(int argc, char **argv)
>  {
>      int ret;
> +    const char *tmpdir = g_get_tmp_dir();
> +    snprintf(p_local_disk, sizeof(p_local_disk), "%s/p_local_disk.XXXXXX", tmpdir);
> +    snprintf(s_local_disk, sizeof(s_local_disk), "%s/s_local_disk.XXXXXX", tmpdir);
> +    snprintf(s_active_disk, sizeof(s_active_disk), "%s/s_active_disk.XXXXXX", tmpdir);
> +    snprintf(s_hidden_disk, sizeof(s_hidden_disk), "%s/s_hidden_disk.XXXXXX", tmpdir);

Don't use PATH_MAX and snprintf.  Please use g_strdup_printf() as suggested
already in previous reviews.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


