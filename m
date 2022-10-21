Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 211C6607496
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 12:00:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloou-0006JN-Am
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:00:07 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloW7-00087Q-PH
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oloVv-0006b6-Ga
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:40:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oloVt-0007t6-PY
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:40:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666345225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K8EZtt3OUldsrbF0/x+gOSNeqqbLIGjTCexPpogixFo=;
 b=H/HrNRJzeXDMsR9MhM9l/emp51kmjmGoB5VU4e6ODMQlHwB4bjor/OvMErBlcvgfOQeY+v
 bo+U2eLjKvWx7yibRdYTLEmLjTW6IFoAU6y+bMByDYUx6hWYZUYYElKlqDQch81837V0Qh
 KV/PuRhFEWQIJsPD12fYGi+vrAJEzKo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-314--V86PT_DO16Es2Wg2HD4dw-1; Fri, 21 Oct 2022 05:40:23 -0400
X-MC-Unique: -V86PT_DO16Es2Wg2HD4dw-1
Received: by mail-wm1-f72.google.com with SMTP id
 h129-20020a1c2187000000b003bf635eac31so1221073wmh.4
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 02:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K8EZtt3OUldsrbF0/x+gOSNeqqbLIGjTCexPpogixFo=;
 b=FRTV6+H3iuDxO9aHH2bLg1VUSE/VJHfBrL+SZyHW7AFc7UhEtXxg6kabU/SLEEV3Qa
 2nobjanEwSBf4T1soAbbEwuoCG7pbNGjF68OtBp6WUb5jx0GjYT5Yqh2ouDuGKQ3skwF
 Uofm/Xbib3A7n9cX9C8aYCqMb6NrnXqtsj/5bJMrfs90zeG9M+CYGP5Ozkb3QfT4pSm4
 buwjHrnmRsuVeiSC1LVpF1mRmrS79WcbMFJSYrctQcrdIVrHzCWXeLVNJM5TDxDGjR9x
 PJvkQOe5IWJzeP9QEPhOGJSYyF3ISf872zYT2kQG8uoti9cBYLqCyZPiKHm2oN51TMzb
 U47w==
X-Gm-Message-State: ACrzQf3RzSthYsGbL0m30y34ZLX926pGRmbsHv1ArxlQx357+9bb1JVc
 sra2mHQlqLemBx1n7b4HOA9h9e+cdwiwqRw26OaoXtOu17d3A3ElUMyzV8yMLrBX1YBU++Kwaev
 yXD2R+lgFvFkqbxA=
X-Received: by 2002:a05:6000:2ae:b0:231:86ac:979a with SMTP id
 l14-20020a05600002ae00b0023186ac979amr11410152wry.611.1666345222078; 
 Fri, 21 Oct 2022 02:40:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7sPtE547KpQojoIkUsHbjkfjuOyhMnemE6FRH6BqW5aT0PywxUUT0b/62AQ7vcfo4tD+GSPw==
X-Received: by 2002:a05:6000:2ae:b0:231:86ac:979a with SMTP id
 l14-20020a05600002ae00b0023186ac979amr11410131wry.611.1666345221835; 
 Fri, 21 Oct 2022 02:40:21 -0700 (PDT)
Received: from redhat.com ([2.54.40.233]) by smtp.gmail.com with ESMTPSA id
 s6-20020a7bc386000000b003c4ecff4e25sm2107524wmj.9.2022.10.21.02.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 02:40:21 -0700 (PDT)
Date: Fri, 21 Oct 2022 05:40:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Ani Sinha <ani@anisinha.ca>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Qemu Devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v6 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
Message-ID: <20221021053828-mutt-send-email-mst@kernel.org>
References: <20221020083810-mutt-send-email-mst@kernel.org>
 <CAARzgwwd_How_h+9sHWPOrWWZ7CbX+DN-uy-KiGf1VVyVmrLnA@mail.gmail.com>
 <20221020084311-mutt-send-email-mst@kernel.org>
 <CAARzgwxfKbrxAqb15GXp4j1enDPUhGBsL5jUzFtDvJkGM-7azw@mail.gmail.com>
 <20221020150857-mutt-send-email-mst@kernel.org>
 <CAARzgwwDjjHL-1fEeuySNZm8NbnGNaeE5h6zrPz_zaANfs5dsw@mail.gmail.com>
 <CAARzgww8P4Za=+r8q2a30TCY7Uzw6g2tgHeLLKr7R+WV-7qQVg@mail.gmail.com>
 <20221021042449-mutt-send-email-mst@kernel.org>
 <CAARzgwyW+ved0iVinWzSCg+KSCL67v+m6KySRdg_hUUev8JLDA@mail.gmail.com>
 <87k04t7ca6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87k04t7ca6.fsf@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Oct 21, 2022 at 10:30:09AM +0100, Alex Bennée wrote:
> 
> Ani Sinha <ani@anisinha.ca> writes:
> 
> > On Fri, Oct 21, 2022 at 2:02 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >>
> >> On Fri, Oct 21, 2022 at 05:45:15AM +0530, Ani Sinha wrote:
> >> > And have multiple platform specific branches in bits that have fixes for those
> >> > platforms so that bits can run there. Plus the existing test can be enhanced to
> >> > pull in binaries from those branches based on the platform on which it is being
> >> > run.
> >> >
> >>
> >> What a mess.
> >> Who is going to be testing all these million platforms?
> >
> > I am not talking about branches in QEMU but branches in bits.
> > If you are going to test multiple platforms, you do need to build bits
> > binaries for them. There is no way around it.
> > bits is not all platform independent python. It does have binary executables.
> >
> > Currently bits is built only for the x86 platform. Other platforms are
> > not tested. I doubt if anyone even tried building bits for arm or
> > mips.
> 
> I'm not worried about test bits on other targets, but we do run x86
> targets on a number of hosts. The current reliance on a special patched
> host build tool for only one architecture is the problem. If  we just
> download the iso that problem goes away.

👍what he said.

> > It makes sense to try things incrementally once we have something going.
> >
> > Lets discuss this on a separate thread.
> >
> >> All this does nothing at all to help developers avoid
> >> bugs and when they do trigger debug the issue. Which is
> >> after all why we have testing.
> >> Yes once in a very long while we are going to tweak
> >> something in the tests, and for that rare occurence
> >> it makes sense to periodically rebuild everything,
> >> otherwise code bitrots.
> >>
> >> But the test is supposed to run within a VM anyway, let's
> >> have an image and be done with it.
> >>
> >> --
> >> MST
> >>
> 
> 
> -- 
> Alex Bennée


