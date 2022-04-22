Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F7350B75F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 14:32:10 +0200 (CEST)
Received: from localhost ([::1]:48384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhsSH-0003DN-Op
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 08:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nhreG-0001M9-4n
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:40:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nhreB-0003Dk-OG
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:40:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650627621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nt2OZStZPas8rdnP4KPbhx4JTT1U+fEfPDkhCsS6cJk=;
 b=itmyR6Z0PUaqGj6/qP+0ntbtzVoJJUW1YiLSyfqa7j7kND5L7o3/zP1/nDuMQ9RJVx6Adh
 jObxTbsO/uHOiJ/Loaj/iPDR63oRJuRgL/jTUyhyyx0ozhD5OY/8giI8ybjaCfpJktDUiV
 GMK/KMoLruXSzZMFhYgV0ma+11U7Vb4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-92HBvnzIMJ6U-baP-7tBfA-1; Fri, 22 Apr 2022 07:40:19 -0400
X-MC-Unique: 92HBvnzIMJ6U-baP-7tBfA-1
Received: by mail-wm1-f70.google.com with SMTP id
 k66-20020a1ca145000000b003928959f8efso3614926wme.1
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 04:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=nt2OZStZPas8rdnP4KPbhx4JTT1U+fEfPDkhCsS6cJk=;
 b=ZvRciRoZBtwenFJLqs/k1eFv8qLkJazXR8hmeLc+1UHtLM/GDgkVHfAEb7aGS9nO//
 Tn1Z7p+f0++AVLzc74HX3gNYvuMIm1CvSUjihDikMUt2y+qazpVoKfd9ndO1NNOhG+QK
 w13L3JjYiuOP4nEf2Y7CJCGdL8a/Uv7udBGRtIkEEPBzG27HJI/Da4nFfzizBpLTsE6l
 8rruGhRsz0HrEpzzyEMmPu4y3l6veMeUWbGqERQWpWd21ucrmlrvzMYEbANszGJyY4lN
 GIp20Ecb/xcWFkFO1futS7uqZUxZr9pMJXBPw+GeeLXmRiAbYua2zw5+M1g7SYa2Ydyp
 f3rg==
X-Gm-Message-State: AOAM533ndp/V5ZXSzffsrIUzvaKLN640aJHuSCmcwNyavhyQAFjGScGa
 W8gW7C5WnLcyAxzvrTVAcRQLNX1h1Plc2mOc2rudvQ/HGGYN36Oehb6lxJRatVU7b3pC7uMnpt9
 n86mHLutVtHmi7e8=
X-Received: by 2002:a7b:cdf7:0:b0:38e:b050:e5be with SMTP id
 p23-20020a7bcdf7000000b0038eb050e5bemr12794361wmj.154.1650627618702; 
 Fri, 22 Apr 2022 04:40:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzT9qVIRcyUTBV5zwR2RA2Em/XsCoOQVfF3fcw9bYweP+uTilVQrjxslY0kz69GgVKAS6a7Ug==
X-Received: by 2002:a7b:cdf7:0:b0:38e:b050:e5be with SMTP id
 p23-20020a7bcdf7000000b0038eb050e5bemr12794339wmj.154.1650627618427; 
 Fri, 22 Apr 2022 04:40:18 -0700 (PDT)
Received: from ?IPv6:2a0c:5a80:1306:2f00:cfcf:62cf:6f38:dd92?
 ([2a0c:5a80:1306:2f00:cfcf:62cf:6f38:dd92])
 by smtp.gmail.com with ESMTPSA id
 190-20020a1c19c7000000b00392c344c842sm1481170wmz.43.2022.04.22.04.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 04:40:17 -0700 (PDT)
Message-ID: <e69cf686fcffa1d352e27e9a5ab0cc50cdf4ea42.camel@redhat.com>
Subject: Re: [PATCH v4 2/3] util/main-loop: Introduce the main loop into QOM
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Date: Fri, 22 Apr 2022 13:40:16 +0200
In-Reply-To: <87r15pz7z2.fsf@pond.sub.org>
References: <20220401093523.873508-1-nsaenzju@redhat.com>
 <20220401093523.873508-3-nsaenzju@redhat.com> <87r15pz7z2.fsf@pond.sub.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsaenzju@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com,
 qemu-block@nongnu.org, michael.roth@amd.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, eduardo@habkost.net, hreitz@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2022-04-22 at 13:13 +0200, Markus Armbruster wrote:
> Nicolas Saenz Julienne <nsaenzju@redhat.com> writes:
> 
> > 'event-loop-base' provides basic property handling for all 'AioContext'
> > based event loops. So let's define a new 'MainLoopClass' that inherits
> > from it. This will permit tweaking the main loop's properties through
> > qapi as well as through the command line using the '-object' keyword[1].
> > Only one instance of 'MainLoopClass' might be created at any time.
> > 
> > 'EventLoopBaseClass' learns a new callback, 'can_be_deleted()' so as to
> > mark 'MainLoop' as non-deletable.
> > 
> > [1] For example:
> >       -object main-loop,id=main-loop,aio-max-batch=<value>
> > 
> > Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> 
> [...]
> 
> > diff --git a/qapi/qom.json b/qapi/qom.json
> > index eeb5395ff3..e5f31c4469 100644
> > --- a/qapi/qom.json
> > +++ b/qapi/qom.json
> > @@ -499,6 +499,17 @@
> >              '*repeat': 'bool',
> >              '*grab-toggle': 'GrabToggleKeys' } }
> >  
> > +##
> > +# @EventLoopBaseProperties:
> > +#
> > +# Common properties for objects derived from EventLoopBase
> 
> This makes sense as internal documentation: QAPI type
> EventLoopBaseProperties is associated with C type EventLoopBase.  Doc
> comments are *external* documentation: they go into the QEMU QMP
> Reference Manual.
> 
> What about "Common properties for event loops"?

Sounds better, yes. I'll change it.

> > +#
> > +# @aio-max-batch: maximum number of requests in a batch for the AIO engine,
> > +#                 0 means that the engine will use its default.
> 
> Missing:
> 
>    # Since: 7.1
> 
> Permit me a short digression.  We add these unthinkingly, because
> thinking is expensive.  Even when the type isn't really part of the
> external interface.  The deeper problem is that we're trying to generate
> documentation of the external interface from doc comments that are
> written as documentation of the internal QAPI data structures.  Here,
> for example, we document EventLoopBaseProperties even though it is a
> purely internal thing: whether we factor out common members into a base
> type or not is not visible in QMP.

Thanks for the explanation.

> > +##
> > +{ 'struct': 'EventLoopBaseProperties',
> > +  'data': { '*aio-max-batch': 'int' } }
> > +
> >  ##
> >  # @IothreadProperties:
> >  #
> > @@ -516,17 +527,26 @@
> >  #               algorithm detects it is spending too long polling without
> >  #               encountering events. 0 selects a default behaviour (default: 0)
> >  #
> > -# @aio-max-batch: maximum number of requests in a batch for the AIO engine,
> > -#                 0 means that the engine will use its default
> > -#                 (default:0, since 6.1)
> > +# The @aio-max-batch option is available since 6.1.
> 
> This separates the member's "since" information from its defintion.
> Can't be helped, because its defined in the base type, but the since
> only applies here.  Okay.

IIUC my compromise of having the 'since version' annotated on each externally
visible type is good, right? No need to add the info in
EventLoopBaseProperties.

> >  #
> >  # Since: 2.0
> >  ##
> >  { 'struct': 'IothreadProperties',
> > +  'base': 'EventLoopBaseProperties',
> >    'data': { '*poll-max-ns': 'int',
> >              '*poll-grow': 'int',
> > -            '*poll-shrink': 'int',
> > -            '*aio-max-batch': 'int' } }
> > +            '*poll-shrink': 'int' } }
> > +
> > +##
> > +# @MainLoopProperties:
> > +#
> > +# Properties for the main-loop object.
> > +#
> > +# Since: 7.1
> > +##
> > +{ 'struct': 'MainLoopProperties',
> > +  'base': 'EventLoopBaseProperties',
> > +  'data': {} }
> 
> The patch does two things:
> 
> 1. Factor EventLoopBaseProperties out of IothreadProperties.
> 
> 2. Create MainLoopProperties.
> 
> I'd split it.  This is not a demand.

Since I'm preparing a v5 of the series, I agree it makes sense to move 1. to
the fist patch.

Thanks!

-- 
Nicolás Sáenz


