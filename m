Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE85B54B780
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 19:19:50 +0200 (CEST)
Received: from localhost ([::1]:52886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1ACj-0004CY-Ev
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 13:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dz4list@gmail.com>)
 id 1o1A8k-00020o-K3; Tue, 14 Jun 2022 13:15:42 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:43912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dz4list@gmail.com>)
 id 1o1A8j-0006fS-1w; Tue, 14 Jun 2022 13:15:42 -0400
Received: by mail-pg1-x52f.google.com with SMTP id s135so9055749pgs.10;
 Tue, 14 Jun 2022 10:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Um4WKZ7clO3V5tjL9vX0VwFZMQY5FRKnLpiorO9oPAU=;
 b=D9WCl657SCnp2ywEEszqm7ro5qjD7Uh6ZcpCM6fZzU8W3Ww+lQxQkuAi9iVcmj4abG
 LRJZjJoU1Ek5q63LiCl56wyY6Kkcvm3bvFpr1CF3SA85i8RCTpMpxz0ByViLIK4AARDj
 LToNdbzX58JMdIW3LDAReF7MvheKzrpNiRwyh0jNT8wISfrDVBsmE6fVkUqlebUwezXb
 KsXoeC+Fb2I8e4WXGkIOynCDJMz8XgcTLuYoZA1+qVCMVIq5FVl8JUxLvEO5qeGgxSYm
 OkBMi2GqAKh0yha0wzgEVN98evMD6UTscUXkrVb3uSgIXiKb2VSeIA2qIGO38aMIMtZp
 CpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Um4WKZ7clO3V5tjL9vX0VwFZMQY5FRKnLpiorO9oPAU=;
 b=wuThoglBkayhgA00pyKpRudKc35k/GEzIzI0hBC+j2LBoQyrZ7Ileqmvbe4eZjncXp
 zXcEvSYTiZGKk8qOLLqsXEc9vdfw+xa00FusLdTlwdnh5rQrgu9WTT/ZxGAWP/7y8Gp9
 exblvH6t3GymwNfZ7rHdAciLPx+2qrhdE8O343JpaTMwBjOmlzmJwjQ2UJMpzXirnWbJ
 lvtqTRLi+RYxiThvLLBfS6iyhdWIKoQ1AJdYCBdkCVIF3Qbk4aV+6vn9IfOznFwUapR+
 qTNHdlvH663aHW7q5/gn54omEmGR6KZ4jP3tjtl69IZHvtcC5OEDL8DOjORDkXfghLTU
 t1dQ==
X-Gm-Message-State: AJIora8SlfT/ZxlNaxtnvNioM+0VsU5YI18xoi+aYGEwtiOD2chWyNCI
 q5rujnUs/WW7XOLJtUsTN+o=
X-Google-Smtp-Source: AGRyM1sWCCD04l5qUr/vdJ7D2eJfF33Y53NZMMmBq0jYeDtlH3GfSFr2wG96dWG1McYSsEQQFpLkbQ==
X-Received: by 2002:a63:9547:0:b0:408:be53:b599 with SMTP id
 t7-20020a639547000000b00408be53b599mr301483pgn.463.1655226938493; 
 Tue, 14 Jun 2022 10:15:38 -0700 (PDT)
Received: from zhdaniel-fedora-MJ0FVN0B ([2620:10d:c090:500::2:9ac3])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a17090aa50c00b001dff2fb7e39sm9843375pjq.24.2022.06.14.10.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 10:15:37 -0700 (PDT)
Date: Tue, 14 Jun 2022 10:15:35 -0700
From: Dan Zhang <dz4list@gmail.com>
To: clg@kaod.org
Cc: alistair@alistair23.me, andrew@aj.id.au, frasse.iglesias@gmail.com,
 hreitz@redhat.com, irischenlj@fb.com, irischenlj@gmail.com,
 joel@jms.id.au, kwolf@redhat.com, lvivier@redhat.com,
 patrick@stwcx.xyz, pbonzini@redhat.com, pdel@fb.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, thuth@redhat.com
Subject: Re: [PATCH] hw:w25p80: Add STATE_STANDBY to handle incorrect command
Message-ID: <YqjCN7B0CkulOhuR@zhdaniel-fedora-MJ0FVN0B>
References: <673b4b6c-b107-ab03-fe51-752ec45e6a04@kaod.org>
 <20220614160246.2888751-1-dz4list@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220614160246.2888751-1-dz4list@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=dz4list@gmail.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi Cedric,

I am sorry that accidently submit a pre-view code change as a patch using the
git-sendmail. 
I originally mean to copy the following code in email reply and let
commnity get better understand my proposal.

Let me submit a formal patch in seperate thread. And will remove the
code using this STATE_STANDBY state, as those code shall be in @iris WP#
patch.

BRs
Dan

On Tue, Jun 14, 2022 at 09:02:46AM -0700, Dan Zhang wrote:
> ---
>  hw/block/m25p80.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index b6bd430a99..3bb0466dca 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -423,6 +423,7 @@ typedef enum {
>      STATE_COLLECTING_DATA,
>      STATE_COLLECTING_VAR_LEN_DATA,
>      STATE_READING_DATA,
> +    STATE_STANDBY,
>  } CMDState;
>  
>  typedef enum {
> @@ -1218,6 +1219,9 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>              || !s->write_enable) {
>              qemu_log_mask(LOG_GUEST_ERROR,
>                            "M25P80: Status register write is disabled!\n");
> +	    qemu_log_mask(LOG_GUEST_ERROR,
> +                          "M25P80: switch to standby, re-aseert CS to reactivate \n");
> +	    s->state = STATE_STANDBY;
>              break;
>          }
>  
> @@ -1472,6 +1476,9 @@ static uint32_t m25p80_transfer8(SSIPeripheral *ss, uint32_t tx)
>                            s->cur_addr, (uint8_t)tx);
>  
>      switch (s->state) {
> +    case STATE_STANDBY:
> +	r = 0xFFFFFFFF; /* StandBy state SO shall be HiZ */
> +	break;
>  
>      case STATE_PAGE_PROGRAM:
>          trace_m25p80_page_program(s, s->cur_addr, (uint8_t)tx);
> -- 
> 2.34.3
> 

