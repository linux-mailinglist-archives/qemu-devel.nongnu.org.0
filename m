Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3350555157
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 18:30:31 +0200 (CEST)
Received: from localhost ([::1]:47850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o43FN-0008SX-28
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 12:30:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1o43Dp-0007kN-88
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 12:28:53 -0400
Received: from esa8.hc2706-39.iphmx.com ([216.71.140.196]:29355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1o43Dn-00009t-6T
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 12:28:52 -0400
X-IronPort-RemoteIP: 209.85.219.71
X-IronPort-MID: 205460184
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:eYsM0q83S+St55YJisiTDrUDC3yTJUtcMsCJ2f8bNWPcYEJGY0x3m
 jRKWWiCa/zZZmqkc4onady38U4OvJOAytA1Twc6rngxFiIbosf7XuiUfxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw03qPp8Zj2tQy2YbjWVvX0
 T/Pi5a31GGNimYc3l08tvrrRCNH5JwebxtB4zTSzdgS1LPvvyB94KA3fMldHFOhKmVgJdNWc
 s6YpF2PEsI1yD92Yj+tuu6TnkTn2dc+NyDX4pZdc/HKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NVmuKGLEQA3BYrdvsszVjpfDS9eG6ITrdcrIVDn2SCS50jPcn+p2us3SU9pZMsX/eF4BWwI/
 vsdQNwPRkrb1qTmnfThE7gq2Z1LwMrDZevzvllpySHfAewOS42FTqnXjTNd9G1o25wQRa+OO
 6L1bxJqPRrGZwNWNWtHI8sCwbmXvyPneiBx/Qf9Sa0fpjK7IBZK+KHgNceQdtGUSMF9mEGeq
 WTbuWPjDXkn2Me3zDOE9je1mLaKk3yiHo0VE7K8+7hhh1j7KnEvNSD6nGCT+ZGR4nNSkfoFQ
 6DI0kLCdZQPyXE=
IronPort-HdrOrdr: A9a23:Myl4nKlJJH7HdCGpu3O9V74DvazpDfIR3DAbv31ZSRFFG/Fxr6
 uV7ZEmPH7P+VUssRQb8rq90ca7LE80iqQFh7X5UY3PYOCEgguVxeNZg7cKqgeIcxEWndQ96U
 4PScdD4PqaNykZsS7AizPId+rJ+bK8gceVbO7lvg5QcT0=
Received: from mail-qv1-f71.google.com ([209.85.219.71])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Jun 2022 12:28:44 -0400
Received: by mail-qv1-f71.google.com with SMTP id
 kd24-20020a056214401800b0046d7fd4a421so17710767qvb.20
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 09:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9jY15O0Lqm0TNzcsU8tNcf7TE3SBw+GT+M9dcJD4a9U=;
 b=VCRhl+NAXO0N1nF4bEywlT1HCIDIukgeKa4GAkSvJWmaNYCABQsR4e2kxC+Fay67+K
 fY+GbWdVpo6om4ydoKqqMbmiJ2oq70VoN9XlwFjbtseNCr4OVBYZY6UxLLDBRmNsyjwJ
 Y2aGmwTByNJX0V1PeN0o2LngjJvi4RhQWdRUzjB67ndgMBkLZiqd98PMucgGEo+25w7j
 09DLu9CYlJsbXew54x2EbS3nqo6/F6XehVxBXxY4qEA9pna7aNJtAptsE5ZLufDni33N
 h4Qlke8S3x0Axp5fCLlAuK9XBJqVUCcs+TmoNT7bzay0bR8U0pSlklWnOlY3K1ZH24W8
 nDTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9jY15O0Lqm0TNzcsU8tNcf7TE3SBw+GT+M9dcJD4a9U=;
 b=GUtyLRVyMIJwoIGnzyviE15oXwEUSelBFEtDoXtZqae5kle8z6Gkw3Y7RTHueDEb/j
 3AKe7cLvI8FJtfbaIADZgsLZnrwM+x6TQinOGt4fIkb98ZE14YAt616+jld6zIZqIhPW
 31rk5hyJLPEWionpOv5bpLqDLNQApivjxLYmLLqbKqDYHGxBBGpw+iXY8DIsH9mn9dFY
 EJaJKBrQB1IsCCYXKezepnnV8qYAgwwaqOB0cncLAwtuPvDg0IJkTPjBiun6IEUZJ8Sx
 gudnKlDCoCFrALjlYwATEPWII6InktivjhWgAWxnpZIBvK8uLfiBKPuiax6AQwrRY9js
 wHPg==
X-Gm-Message-State: AJIora+0VW/SYsF3ESlYrLmc0eC4MrLPjcdzfzXG5q8wzjcARAcMJ1ub
 usrUajZe3bg68TnI+vxY8W9t4ue/b3Gqviyn6XEmMplUZSwyVip0X4ICJuO0O3/vsMwU4j+pafC
 3jIvqFOOrVfx4LpqXLJPayjQNtBbPXA==
X-Received: by 2002:ad4:5de4:0:b0:470:466b:15c4 with SMTP id
 jn4-20020ad45de4000000b00470466b15c4mr11765696qvb.34.1655915324329; 
 Wed, 22 Jun 2022 09:28:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vd4SYSnUG58SymyL1EPagC11W30DnV3vSHcWwL2v0F/NFTRnh6cPdA7oq2W+ttqVIzuAB7Dw==
X-Received: by 2002:ad4:5de4:0:b0:470:466b:15c4 with SMTP id
 jn4-20020ad45de4000000b00470466b15c4mr11765678qvb.34.1655915324103; 
 Wed, 22 Jun 2022 09:28:44 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a37f909000000b006a99088cd99sm16727641qkj.6.2022.06.22.09.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 09:28:43 -0700 (PDT)
Date: Wed, 22 Jun 2022 12:28:40 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Darren Kenny <darren.kenny@oracle.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: Re: [PATCH] fuzz: only use generic-fuzz targets on oss-fuzz
Message-ID: <20220622162635.eacnjindlfolsoqe@mozz.bu.edu>
References: <20220622155028.2086196-1-alxndr@bu.edu>
 <m2sfnwk7nl.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m2sfnwk7nl.fsf@oracle.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.196; envelope-from=alxndr@bu.edu;
 helo=esa8.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 220622 1703, Darren Kenny wrote:
> Hi Alex,
> 
> This looks good to me, so:
> 
> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> 
> But, if it is at all possible to use Bash glob in a '[[ ... ]]' test
> such as:
> 
>   if [[ $target == generic-fuzz-* ]]; then
> 
> that might read better - but it seems the default is that we don't
> assume that, or am I wrong? (This is probably a question for others on
> the CC-list)

That sounds good to me. Should we change the script to #!/bin/bash, to
be safe?
-Alex

> 
> Thanks,
> 
> Darren.
> 
> On Wednesday, 2022-06-22 at 11:50:28 -04, Alexander Bulekov wrote:
> > The non-generic-fuzz targets often time-out, or run out of memory.
> > Additionally, they create unreproducible bug-reports. It is possible
> > that this is resulting in failing coverage-reports on OSS-Fuzz. In the
> > future, these test-cases should be fixed, or removed.
> >
> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > ---
> >  scripts/oss-fuzz/build.sh | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
> > index 98b56e0521..d8b4446d24 100755
> > --- a/scripts/oss-fuzz/build.sh
> > +++ b/scripts/oss-fuzz/build.sh
> > @@ -105,7 +105,7 @@ do
> >      # to be configured. We have some generic-fuzz-{pc-q35, floppy, ...} targets
> >      # that are thin wrappers around this target that set the required
> >      # environment variables according to predefined configs.
> > -    if [ "$target" != "generic-fuzz" ]; then
> > +    if echo "$target" | grep -q "generic-fuzz-"; then
> >          ln  $base_copy \
> >              "$DEST_DIR/qemu-fuzz-i386-target-$target"
> >      fi
> > -- 
> > 2.27.0

