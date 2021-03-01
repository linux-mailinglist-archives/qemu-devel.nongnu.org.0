Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D42FD327E46
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 13:28:23 +0100 (CET)
Received: from localhost ([::1]:59312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGhew-0006JX-Qr
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 07:28:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lGhdP-0004Yi-JQ
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 07:26:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lGhdN-0001nz-Pv
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 07:26:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614601603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wMZN8lxBKFl5EmNsdI2K5dPp/8ZvooFAVuFIb8BA2k8=;
 b=izbzrC4tPLecR2JrL5tUZhxDtq0sR+UHsWIBW/wu0KDTJ1evtkIEhTvQcnJqI/2WLoj7e6
 0QHM50eV95sRvUVDvXrsq1yDmPv4hz2KsGyH3nXiAuWIv45DoDcKoV+dw+l3QzAS+PwWP9
 zKouj/clcGzV5EKhGqYENQ9MtxRVl7w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-GSakf6U9P02xVLwTNx6ecQ-1; Mon, 01 Mar 2021 07:26:41 -0500
X-MC-Unique: GSakf6U9P02xVLwTNx6ecQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93314835E22;
 Mon,  1 Mar 2021 12:26:40 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-165.ams2.redhat.com [10.36.114.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE3DE5D71F;
 Mon,  1 Mar 2021 12:26:39 +0000 (UTC)
Date: Mon, 1 Mar 2021 13:26:38 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] storage-daemon: include current command line option in
 the errors
Message-ID: <20210301122638.GG7698@merkur.fritz.box>
References: <20210226110312.157645-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210226110312.157645-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.02.2021 um 12:03 hat Paolo Bonzini geschrieben:
> Use the location management facilities that the emulator uses, so that
> the current command line option appears in the error message.
> 
> Before:
> 
>   $ storage-daemon/qemu-storage-daemon --nbd key..=
>   qemu-storage-daemon: Invalid parameter 'key..'
> 
> After:
> 
>   $ storage-daemon/qemu-storage-daemon --nbd key..=
>   qemu-storage-daemon: --nbd key..=: Invalid parameter 'key..'
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  storage-daemon/qemu-storage-daemon.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
> index 9021a46b3a..a8f8d83f6f 100644
> --- a/storage-daemon/qemu-storage-daemon.c
> +++ b/storage-daemon/qemu-storage-daemon.c
> @@ -152,6 +152,20 @@ static void init_qmp_commands(void)
>                           qmp_marshal_qmp_capabilities, QCO_ALLOW_PRECONFIG);
>  }
>  
> +static int getopt_set_loc(int argc, char **argv, const char *optstring,
> +                          const struct option *longopts)
> +{
> +    int c, save_index;
> +
> +    optarg = NULL;
> +    save_index = optind;
> +    c = getopt_long(argc, argv, optstring, longopts, NULL);
> +    if (optarg) {
> +        loc_set_cmdline(argv, save_index, MAX(1, optind - save_index));

This save_index approach isn't perfect because getopt may skip
non-option arguments and they will be included in the help text:

    $ build/storage-daemon/qemu-storage-daemon foo --object iothread
    qemu-storage-daemon: foo --object iothread: Parameter 'id' is missing

    $ build/storage-daemon/qemu-storage-daemon foo --object iothread,id=t
    qemu-storage-daemon: --object iothread,id=t foo: Unexpected argument: foo

However, without changing the interface of loc_set_cmdline(), getting
the right index seems hard. Not sure what is the best way for fixing
this or if it's worth the effort.

Kevin

> +    }
> +    return c;
> +}
> +
>  static void process_options(int argc, char *argv[])
>  {
>      int c;
> @@ -174,7 +188,7 @@ static void process_options(int argc, char *argv[])
>       * they are given on the command lines. This means that things must be
>       * defined first before they can be referenced in another option.
>       */
> -    while ((c = getopt_long(argc, argv, "hT:V", long_options, NULL)) != -1) {
> +    while ((c = getopt_set_loc(argc, argv, "hT:V", long_options)) != -1) {
>          switch (c) {
>          case '?':
>              exit(EXIT_FAILURE);
> @@ -283,6 +297,7 @@ static void process_options(int argc, char *argv[])
>          error_report("Unexpected argument: %s", argv[optind]);
>          exit(EXIT_FAILURE);
>      }
> +    loc_set_none();
>  }
>  
>  int main(int argc, char *argv[])
> -- 
> 2.26.2
> 


