Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9A64F86C9
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 20:00:03 +0200 (CEST)
Received: from localhost ([::1]:44822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncWQM-0003Hl-1r
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 14:00:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ncWPI-0002bi-9U
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 13:58:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ncWPF-0003rB-Cb
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 13:58:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649354332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3u5y5mwfa3wdW1YXjjjo7ezTlfYyesKEV3QZ7vBqyFw=;
 b=B/T2AanpDIQN406VGEOT70GdgfcsM/gTA+avPS8KcUvZ0+J3VVroJWDiYyMh6ze6dryzCy
 sv2y0SDnUnP6EmhGY35A0ySLJ3WAe0bmH4hvIjMkCRbQ8FmOpIUA5meoYx8LFLu649xLzW
 5Xu8aRLSG0BhF4SvgiYZzqraldzO+Qc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-uAP9GvT8Mpmlb5EtVjv72w-1; Thu, 07 Apr 2022 13:58:51 -0400
X-MC-Unique: uAP9GvT8Mpmlb5EtVjv72w-1
Received: by mail-wm1-f70.google.com with SMTP id
 i6-20020a05600c354600b0038be262d9d9so4860832wmq.8
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 10:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=3u5y5mwfa3wdW1YXjjjo7ezTlfYyesKEV3QZ7vBqyFw=;
 b=RinhiXiwteVtnvCdjEGW7LNCRQtiyJcoH2OWHJXgSf0Xgxscd95Yh5KslhymFAHHZg
 bsIDjZwZwMuFbMXpqVtTS8DkQu0Paxru+/Rk6iSVytlySTzDjQUj1CwqyWjiBL+dEMEJ
 6HFLIEknIz9Gw6malr7Wu+cqPnEFpDNIvJuQC07HPtaewot5EnfdYhg2YpfW/3ea9hC+
 RUyndHZ0zS4H48EmJG0jFngHe65bxXDlDkRJq7frJpnwoaqzFxk02qdEvDpONsCXSWBR
 Zidrg3AXDBInkicfIGqrvfGGHeykM6E92HlQvBK4yJnW/tde5rxkClFUB4q8q4RCA7gp
 vNPw==
X-Gm-Message-State: AOAM530FxdwPxItRdzthe/va3sWOyYdrgga7g7Sv3PFOlg2/CB+ROBq9
 KcuLH4RkmUD7ZUAXfZVgAO2Y7GjxZS8qYR2gseeTO39qI0571ck1WPczvzs3PQcdcV83qA1qK1x
 flszuw2XxhpiUcO0=
X-Received: by 2002:a05:600c:2f8f:b0:38c:889b:b211 with SMTP id
 t15-20020a05600c2f8f00b0038c889bb211mr13320489wmn.151.1649354330436; 
 Thu, 07 Apr 2022 10:58:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYC8+nJY+nRs1tqDkTXsL9030D21GROjvH7/jpEmEUDlFQXP3q5zz+DefJK2uyNyYnsqBOug==
X-Received: by 2002:a05:600c:2f8f:b0:38c:889b:b211 with SMTP id
 t15-20020a05600c2f8f00b0038c889bb211mr13320463wmn.151.1649354330145; 
 Thu, 07 Apr 2022 10:58:50 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 u7-20020a5d6da7000000b00203d9d1875bsm20156907wrs.73.2022.04.07.10.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 10:58:49 -0700 (PDT)
Date: Thu, 7 Apr 2022 18:58:47 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v4 2/2] Added parameter to take screenshot with
 screendump as PNG
Message-ID: <Yk8mVyza54cbCim9@work-vm>
References: <20220330061134.59254-1-kshitij.suri@nutanix.com>
 <20220330061134.59254-3-kshitij.suri@nutanix.com>
 <87wng96oep.fsf@pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87wng96oep.fsf@pond.sub.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: soham.ghosh@nutanix.com, peter.maydell@linaro.org, thuth@redhat.com,
 berrange@redhat.com, prerna.saxena@nutanix.com, qemu-devel@nongnu.org,
 Kshitij Suri <kshitij.suri@nutanix.com>, philippe.mathieu.daude@gmail.com,
 kraxel@redhat.com, pbonzini@redhat.com, prachatos.mitra@nutanix.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Markus Armbruster (armbru@redhat.com) wrote:
> Dave, please have a look at the HMP compatibility issue in
> hmp-command.hx below.
> 
> Kshitij Suri <kshitij.suri@nutanix.com> writes:
> 
> > Currently screendump only supports PPM format, which is un-compressed and not
> > standard.
> 
> If "standard" means "have to pay a standards organization $$$ to access
> the spec", PPM is not standard.  If it means "widely supported", it
> certainly is.  I'd drop "and not standard".  Suggestion, not demand.
> 
> >           Added a "format" parameter to qemu monitor screendump capabilites
> > to support PNG image capture using libpng. The param was added in QAPI schema
> > of screendump present in ui.json along with png_save() function which converts
> > pixman_image to PNG. HMP command equivalent was also modified to support the
> > feature.
> 
> Suggest to use imperative mood to describe the commit, and omit details
> that aren't necessary here:
> 
>             Add a "format" parameter to QMP and HMP screendump command
>   to support PNG image capture using libpng.
> 
> >
> > Example usage:
> > { "execute": "screendump", "arguments": { "filename": "/tmp/image",
> > "format":"png" } }
> 
> Providing an example in the commit message is always nice, thanks!
> 
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/718
> >
> > Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
> >
> > Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  hmp-commands.hx    |  11 ++---
> >  monitor/hmp-cmds.c |  12 +++++-
> >  qapi/ui.json       |  24 +++++++++--
> >  ui/console.c       | 101 +++++++++++++++++++++++++++++++++++++++++++--
> >  4 files changed, 136 insertions(+), 12 deletions(-)
> >
> > diff --git a/hmp-commands.hx b/hmp-commands.hx
> > index 8476277aa9..19b7cab595 100644
> > --- a/hmp-commands.hx
> > +++ b/hmp-commands.hx
> > @@ -244,11 +244,12 @@ ERST
> >  
> >      {
> >          .name       = "screendump",
> > -        .args_type  = "filename:F,device:s?,head:i?",
> > -        .params     = "filename [device [head]]",
> > -        .help       = "save screen from head 'head' of display device 'device' "
> > -                      "into PPM image 'filename'",
> > -        .cmd        = hmp_screendump,
> > +        .args_type  = "filename:F,format:s?,device:s?,head:i?",
> 
> Incompatible change: meaning of "screendump ONE TWO" changes from
> filename=ONE, device=TWO to filename=ONE, format=TWO.
> 
> As HMP is not a stable interface, incompatible change is permissible.
> But is this one wise?
> 
> Could we add the new argument at the end instead?
> 
>             .args_type  = "filename:F,device:s?,head:i?,format:s?",
> 
> Could we do *without* an argument, and derive the format from the
> filename extension?  .png means format=png, anything else format=ppm.
> Would be a bad idea for QMP.  Okay for HMP?

Could we use the new optional flag with value that Stefan Reiter
added in 26fcd76 ? (and used in 675fd3c)
In which case I think we'd have:
  "filename:F,format:-fs,device:s?,head:i?"

That would seem cleanest;  Extracting from the filename would be OKish
if it errored if the format wasn't obvious.

Dave


> > +        .params     = "filename [format] [device [head]]",
> 
> This tells us that parameter format can be omitted like so
> 
>     screendump foo.ppm device-id
> 
> which isn't true.  Better: "filename [format [device [head]]".
> 
> > +        .help       = "save screen from head 'head' of display device 'device'"
> > +                      "in specified format 'format' as image 'filename'."
> > +                      "Currently only 'png' and 'ppm' formats are supported.",
> > +         .cmd        = hmp_screendump,
> >          .coroutine  = true,
> >      },
> >  
> > diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> > index 634968498b..2442bfa989 100644
> > --- a/monitor/hmp-cmds.c
> > +++ b/monitor/hmp-cmds.c
> > @@ -1720,9 +1720,19 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
> >      const char *filename = qdict_get_str(qdict, "filename");
> >      const char *id = qdict_get_try_str(qdict, "device");
> >      int64_t head = qdict_get_try_int(qdict, "head", 0);
> > +    const char *input_format  = qdict_get_try_str(qdict, "format");
> >      Error *err = NULL;
> > +    ImageFormat format;
> >  
> > -    qmp_screendump(filename, id != NULL, id, id != NULL, head, &err);
> > +    format = qapi_enum_parse(&ImageFormat_lookup, input_format,
> > +                              IMAGE_FORMAT_PPM, &err);
> > +    if (err) {
> > +        goto end;
> > +    }
> > +
> > +    qmp_screendump(filename, id != NULL, id, id != NULL, head,
> > +                   input_format != NULL, format, &err);
> > +end:
> >      hmp_handle_error(mon, err);
> >  }
> >  
> > diff --git a/qapi/ui.json b/qapi/ui.json
> > index 664da9e462..24371fce05 100644
> > --- a/qapi/ui.json
> > +++ b/qapi/ui.json
> > @@ -157,12 +157,27 @@
> >  ##
> >  { 'command': 'expire_password', 'boxed': true, 'data': 'ExpirePasswordOptions' }
> >  
> > +##
> > +# @ImageFormat:
> > +#
> > +# Supported image format types.
> > +#
> > +# @png: PNG format
> > +#
> > +# @ppm: PPM format
> > +#
> > +# Since: 7.1
> > +#
> > +##
> > +{ 'enum': 'ImageFormat',
> > +  'data': ['ppm', 'png'] }
> > +
> >  ##
> >  # @screendump:
> >  #
> > -# Write a PPM of the VGA screen to a file.
> > +# Capture the contents of a screen and write it to a file.
> >  #
> > -# @filename: the path of a new PPM file to store the image
> > +# @filename: the path of a new file to store the image
> >  #
> >  # @device: ID of the display device that should be dumped. If this parameter
> >  #          is missing, the primary display will be used. (Since 2.12)
> > @@ -171,6 +186,8 @@
> >  #        parameter is missing, head #0 will be used. Also note that the head
> >  #        can only be specified in conjunction with the device ID. (Since 2.12)
> >  #
> > +# @format: image format for screendump is specified. (default: ppm) (Since 7.1)
> 
> Recommend
> 
>    # @format: image format for screendump (default: ppm) (Since 7.1)
> 
> > +#
> >  # Returns: Nothing on success
> >  #
> >  # Since: 0.14
> > @@ -183,7 +200,8 @@
> >  #
> >  ##
> >  { 'command': 'screendump',
> > -  'data': {'filename': 'str', '*device': 'str', '*head': 'int'},
> > +  'data': {'filename': 'str', '*device': 'str', '*head': 'int',
> > +           '*format': 'ImageFormat'},
> >    'coroutine': true }
> >  
> >  ##
> 
> QAPI schema
> Acked-by: Markus Armbruster <armbru@redhat.com>
> 
> [...]
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


