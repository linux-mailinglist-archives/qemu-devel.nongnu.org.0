Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFC95634E7
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 16:12:11 +0200 (CEST)
Received: from localhost ([::1]:35968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7HNS-0002mu-Ro
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 10:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7GqN-00050T-In
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:37:59 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:35744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7GqK-0006ko-30
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:37:58 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-317741c86fdso24129087b3.2
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 06:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rgGEi+GxZd3aZab8CSbw/JVttZfRhyX8ESjeus14v80=;
 b=nVHxstfJDT7bzDDvD61oZzYkHIdoOxhnOhe4FPB9qoiKTFa9FHHfqltR0DnllLtn0D
 oQibcDn4xokxD02D5psi8Tq8TKIZDbbT/aefBH1OFITIWxnWiRO63GrMiDQI4raXnTQX
 iCzy/Q8c5/RXGc5NWFxV2xXo+ccuZY/xj/1KWHBkHHy+o2YY8EGkFCMiN5gpbmkXZseT
 b59r0mocoawpQrE+rmhRC8Y6FHAehbm9fSBkDyU8VLzjtzJZ6GSJmW/FdrmiTzDz1IjD
 uyt2CmW99UHq+juOKWMJYGynYTtP1eD7/B7aQjvUfvfzcGYxkTwQ3Y8ZohEQN5tOIYfl
 Tw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rgGEi+GxZd3aZab8CSbw/JVttZfRhyX8ESjeus14v80=;
 b=7Tjsd9kY2NTWv54rA/4wQ8rHrXYEGqS3gy4cN25dRjVLL2Wfdpbf7jWBc8GITFRj3s
 2VUJBXaDPO/tlyVs+Lej8SX6Q8G93JLmtJ9GWWD+aLFvAN3EUDY2aRGSBtF9lL2NLVJp
 b7SpmzmESN0uwHXmrQOOvi+kXhxwBnuj8zWKdrK0xVipMdeBFbsK4FbuvnYQ1QI4xfQF
 P37bEPfHWA+rshwcQgPr56FQaA+X5XYT+FXok9Jz4CG6LIjz1CSoXjWWDO2+05fdkTOt
 0L0YfV6qQ4VqLrHjK2JW9i9zRYgS/Bc0XIlQDxYpV5LngXaZrkWhNtrh/UKahZJLoJQh
 HeuQ==
X-Gm-Message-State: AJIora8WVtgwxVC4DZeHwPcemehsHeTNKxi/cJbj+Tkuudc3a0PiwvcR
 mvhMuCqXQmg1qJxjsT95rwDTAOFt1ai9w5+FstSadA==
X-Google-Smtp-Source: AGRyM1vUw0rNhl+VTJ7Z2Q3qk/8xpkh8JJv3vF/cv4gYxkIyRG2r9yzgv/vK01zK8LF84naKlVHNIiCwUVAEAtruEDI=
X-Received: by 2002:a81:1cc:0:b0:317:a0fa:7a61 with SMTP id
 195-20020a8101cc000000b00317a0fa7a61mr16540279ywb.10.1656682674855; Fri, 01
 Jul 2022 06:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211015144640.198044-1-kwolf@redhat.com>
 <20211015144640.198044-15-kwolf@redhat.com>
In-Reply-To: <20211015144640.198044-15-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 14:37:16 +0100
Message-ID: <CAFEAcA9jnySMWRD56FF9D7rXhwARiyvqJx+4Ys+smYa2ghdLBg@mail.gmail.com>
Subject: Re: [PULL 14/15] qdev: Base object creation on QDict rather than
 QemuOpts
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, 15 Oct 2021 at 16:01, Kevin Wolf <kwolf@redhat.com> wrote:
> QDicts are both what QMP natively uses and what the keyval parser
> produces. Going through QemuOpts isn't useful for either one, so switch
> the main device creation function to QDicts. By sharing more code with
> the -object/object-add code path, we can even reduce the code size a
> bit.
>
> This commit doesn't remove the detour through QemuOpts from any code
> path yet, but it allows the following commits to do so.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> Message-Id: <20211008133442.141332-15-kwolf@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Tested-by: Peter Krempa <pkrempa@redhat.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Hi; we discovered via a report on IRC this this commit broke
handling of "array properties", of which one example is:
qemu-system-x86_64 -netdev user,id=a -device rocker,len-ports=1,ports[0]=a

This used to work, and now fails with
 qemu-system-x86_64: -device rocker,len-ports=1,ports[0]=a: Property
'rocker.ports[0]' not found

I think this happens because array properties have the
requirement that the len-foo property is set first before
any of the foo[n] properties can be set. In the old code
I guess we used to set properties from the command line
in the order they were specified, whereas in the new code
we end up in object_set_properties_from_qdict() which
tries to set them in whatever order the qdict hash table
provides them, which turns out to be the wrong one :-(

Any suggestions for how to address this ?

thanks
-- PMM

