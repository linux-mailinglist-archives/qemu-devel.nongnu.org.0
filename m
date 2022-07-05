Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9A65675D8
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 19:35:05 +0200 (CEST)
Received: from localhost ([::1]:58266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8mS0-0007M0-8W
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 13:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8mPh-0005JA-GM
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 13:32:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8mPc-0002RY-RV
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 13:32:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657042355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QxSdmRIPlOb5I+/vGc5jOkT099AmxaEm2r2D2GwQtqg=;
 b=egIETacPQ6sEpQOfFnJYsmHGdtFyd1JI9Rgied/Lgm3HHzHB7zEu6pbPbtZzg8b8wT4tGv
 0lRawvzho/Ssbno6ZLSr+EjNU60/uYyDLHNyED5k73zAV/bQ4jdvt5RBUYIz4gUWLkvaL/
 UWvRrFJAPrGg6xlJqA3dVUA0yICupNE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-5QWydmMpOFe9CGufId-9zQ-1; Tue, 05 Jul 2022 13:32:34 -0400
X-MC-Unique: 5QWydmMpOFe9CGufId-9zQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 az40-20020a05600c602800b003a048edf007so5524709wmb.5
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 10:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=QxSdmRIPlOb5I+/vGc5jOkT099AmxaEm2r2D2GwQtqg=;
 b=KXsLqkITKvUWsvCelyrREy0AlPZfMIaddrw5LAtznx77lc9fFB2uwPPfgdwTMEnGr5
 lT25DlIquCiyl35Oc1jQupM9M/LFSQcw5YteWDajOnyr1pSlZj2bUna1YbgY0+jvegXi
 zs8Rr8J3BXVbCrR5RysD5B96xFSTo3UoojJUBGLgh5VeYEumoHCMyxfj7PR2OXwj4veR
 CssWbtd/mxFsQrPaHuqyzqB5be4El4wEntwySDAFGv//3iLfTVt2BiBv4YEopXP+dDl6
 C/ueXE6rdXrpbbb3v9V/xUSNiZlHC5eDYWU+ozYkwPR9xjLI8/bX5QHtkWT0P+VyyK6F
 vmiQ==
X-Gm-Message-State: AJIora+hTZrDg2qg8w/gVo+A+AxezVliGGOiR8gYMbF/6wqD8cXASFUc
 kGKarutzYAzALWJmqOZpljnvMhy8lrZpZu891EOPHyfcJ8Q8qZ+8d3gMLC0Mg0why89ZEn125sB
 eHNGgOjrQFA0aAw8=
X-Received: by 2002:a5d:64e2:0:b0:21d:38e8:2497 with SMTP id
 g2-20020a5d64e2000000b0021d38e82497mr26799063wri.142.1657042353359; 
 Tue, 05 Jul 2022 10:32:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v7Wp3QdLNraGxAa2LSJ4009N3TxohsshLev1IqNWtvwwwygb37nLTbXWFbB7kUFxKHuoG5vA==
X-Received: by 2002:a5d:64e2:0:b0:21d:38e8:2497 with SMTP id
 g2-20020a5d64e2000000b0021d38e82497mr26799038wri.142.1657042353100; 
 Tue, 05 Jul 2022 10:32:33 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 l14-20020a05600c4f0e00b003a199ed4f44sm12676161wmq.27.2022.07.05.10.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 10:32:32 -0700 (PDT)
Date: Tue, 5 Jul 2022 18:32:30 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH] multifd: Copy pages before compressing them with zlib
Message-ID: <YsR1rq8mh6lGUlC0@work-vm>
References: <20220704164112.2890137-1-iii@linux.ibm.com>
 <YsRYS7PdeMohyUDi@work-vm>
 <56ee56641ae963e3df2b59e6124aaa2b23033fec.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56ee56641ae963e3df2b59e6124aaa2b23033fec.camel@linux.ibm.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

* Ilya Leoshkevich (iii@linux.ibm.com) wrote:
> On Tue, 2022-07-05 at 16:27 +0100, Dr. David Alan Gilbert wrote:
> > * Ilya Leoshkevich (iii@linux.ibm.com) wrote:
> > > zlib_send_prepare() compresses pages of a running VM. zlib does not
> > > make any thread-safety guarantees with respect to changing
> > > deflate()
> > > input concurrently with deflate() [1].
> > > 
> > > One can observe problems due to this with the IBM zEnterprise Data
> > > Compression accelerator capable zlib [2]. When the hardware
> > > acceleration is enabled, migration/multifd/tcp/plain/zlib test
> > > fails
> > > intermittently [3] due to sliding window corruption. The
> > > accelerator's
> > > architecture explicitly discourages concurrent accesses [4]:
> > > 
> > >     Page 26-57, "Other Conditions":
> > > 
> > >     As observed by this CPU, other CPUs, and channel
> > >     programs, references to the parameter block, first,
> > >     second, and third operands may be multiple-access
> > >     references, accesses to these storage locations are
> > >     not necessarily block-concurrent, and the sequence
> > >     of these accesses or references is undefined.
> > > 
> > > Mark Adler pointed out that vanilla zlib performs double fetches
> > > under
> > > certain circumstances as well [5], therefore we need to copy data
> > > before passing it to deflate().
> > 
> > Thanks for fixing that!
> > 
> > > [1] https://zlib.net/manual.html
> > > [2] https://github.com/madler/zlib/pull/410
> > > [3]
> > > https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03988.html
> > > [4] http://publibfp.dhe.ibm.com/epubs/pdf/a227832c.pdf
> > > [5] https://gitlab.com/qemu-project/qemu/-/issues/1099
> > > 
> > > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > > ---
> > > 
> > > v1:
> > > https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg06841.html
> > > v1 -> v2: Rebase, mention Mark Adler's reply in the commit message.
> > > 
> > >  migration/multifd-zlib.c | 35 ++++++++++++++++++++++-------------
> > >  1 file changed, 22 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
> > > index 3a7ae44485..b6b22b7d1f 100644
> > > --- a/migration/multifd-zlib.c
> > > +++ b/migration/multifd-zlib.c
> > > @@ -27,6 +27,8 @@ struct zlib_data {
> > >      uint8_t *zbuff;
> > >      /* size of compressed buffer */
> > >      uint32_t zbuff_len;
> > > +    /* uncompressed buffer */
> > > +    uint8_t buf[];
> > >  };
> > >  
> > >  /* Multifd zlib compression */
> > > @@ -43,9 +45,18 @@ struct zlib_data {
> > >   */
> > >  static int zlib_send_setup(MultiFDSendParams *p, Error **errp)
> > >  {
> > > -    struct zlib_data *z = g_new0(struct zlib_data, 1);
> > > -    z_stream *zs = &z->zs;
> > > +    /* This is the maximum size of the compressed buffer */
> > > +    uint32_t zbuff_len = compressBound(MULTIFD_PACKET_SIZE);
> > > +    size_t buf_len = qemu_target_page_size();
> > > +    struct zlib_data *z;
> > > +    z_stream *zs;
> > >  
> > > +    z = g_try_malloc0(sizeof(struct zlib_data) + buf_len +
> > > zbuff_len);
> > 
> > So I think this works; but wouldn't life be easier if you just used
> > separate malloc's for the buffers?  You've got a lot of hairy pointer
> > maths below that would go away if they were separate.
> > 
> > Dave
> 
> I was trying to avoid an (IMHO equally hairy) error handling sequence
> here. But I don't mind changing this if an alternative would be more
> maintainable.

It's probably worth trying; I bet it works out a lot simpler.
Remember that g_free(NULL) is safe; so if you want to do a cleanup
of a bunch of pointers you can do:
  g_free(a);
  g_free(b);
  g_free(c);

even if some combination of those hadn't been allocated yet.

Dave

> Best regards,
> Ilya
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


