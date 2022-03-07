Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F134D07C8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 20:34:12 +0100 (CET)
Received: from localhost ([::1]:36020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRJ7T-00045o-9B
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 14:34:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1nRJ46-0000RR-4K
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 14:30:42 -0500
Received: from [2a00:1450:4864:20::632] (port=40578
 helo=mail-ej1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1nRJ44-0008B3-I5
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 14:30:41 -0500
Received: by mail-ej1-x632.google.com with SMTP id p15so34257195ejc.7
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 11:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=b+5Q/BguSUazMSqVhw2SH2qkG5kNVZqZ2CMecoqrJkk=;
 b=l03Mnlk5JVYSevtecOmRl5/anrJeBQ6FIOsxF3FUbWvsJyYCvXfWPS23BxKle8ERXC
 XtLMRMwiJssZvQifrI9dip3CgFJ2oWy8ifG5bm/iVqY3vaQX5BqTypuQ6oBvUabd0unV
 Ms917FGKIHeN1GDFET2nue0ALaPokAiYMwngFmQCfGrUYOZ0lHkrudZBXqnhOjbG+nT0
 KVOLq3iah6ZGrLHREChY+MMs4c/2NgXBuY80nQsLRL4khzkstt2atSLP4sPM6/3T8kSJ
 co/yT9n6X2V0TqmWT3lwY8GPQcYdMvQs5tC/Wr+mf7CcfWn+rRmJLbDa8cMFbzN73n2k
 kveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=b+5Q/BguSUazMSqVhw2SH2qkG5kNVZqZ2CMecoqrJkk=;
 b=VT5rimb98W4JPdFJU3ON6YOhuu/CK/OdQN1QULeacP9jQ2zXxDJkGK9iiu2xqfBXof
 QSNFXYiCkaNLZY3Ai+WRVUcSg9XvIIAr/+3cGXQeZu+kATfE5rbB2pCHeYHYD8qMlxnJ
 TLysooYW9EOgh+JbNkgn9TpQci1d8dHJbjD5kMD5h+ZbQ6LQ28oWwumJAN5GK1M2l8Xc
 cPdMUDO8y3dcdGPH8DFFCC415XBxgfDfopjXsfjeA7AJmP0e+5urfN4wtRbbeaBihr6V
 pZ5inxq4pr7A2ZGBhFd9QOoGMAyHOYNeSbNQNF5syQd8/V7QqPjoNEHqjsgJiHVWwvRl
 Nlcg==
X-Gm-Message-State: AOAM530iAPy0hI9yRu7zNcuxbdEDN48LDa7dbfz6DJcNTLr7AiRDKPD/
 rD8v+QNFU0su2LIO47i9gcKW9zGiAM4IrxT7Xp8MPA==
X-Google-Smtp-Source: ABdhPJxjwcbrVbLvsetszBDSLfPhW+GWtVikge2WJWSzOyjKtXBsncPCD46JWI+Gn+GsCmAntCzzaxVkMsUwhopdBG8=
X-Received: by 2002:a17:906:49d4:b0:6d6:e5ec:9a23 with SMTP id
 w20-20020a17090649d400b006d6e5ec9a23mr10270392ejv.79.1646681436938; Mon, 07
 Mar 2022 11:30:36 -0800 (PST)
MIME-Version: 1.0
References: <20220302015053.1984165-1-titusr@google.com>
 <20220302015053.1984165-3-titusr@google.com>
 <8524997d-48a4-9a00-8d94-b6e4d922a82e@gmail.com>
In-Reply-To: <8524997d-48a4-9a00-8d94-b6e4d922a82e@gmail.com>
From: Titus Rwantare <titusr@google.com>
Date: Mon, 7 Mar 2022 11:30:00 -0800
Message-ID: <CAMvPwGpiyw3MhSY8AQkT-5WpsdgONDJz7St_WDwEiEM5j_b+qw@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] hw/i2c: pmbus: guard against out of range accesses
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Cc: Corey Minyard <minyard@acm.org>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 f4bug@amsat.org, wuhaotsh@google.com, venture@google.com, 
 peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::632
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=titusr@google.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -161
X-Spam_score: -16.2
X-Spam_bar: ----------------
X-Spam_report: (-16.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

Ack. All errors for PMBus should
ideally be reflected in status and status_cml registers instead of
carrying meaning in return values. I'll have to separately go through
the existing code to make it consistent.


On Fri, 4 Mar 2022 at 16:08, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> On 2/3/22 02:50, Titus Rwantare wrote:
> > Signed-off-by: Titus Rwantare <titusr@google.com>
> > ---
> >   hw/i2c/pmbus_device.c | 41 ++++++++++++++++++++++++++++++++++++++++-
> >   1 file changed, 40 insertions(+), 1 deletion(-)
>
> >   static uint8_t pmbus_receive_byte(SMBusDevice *smd)
> >   {
> >       PMBusDevice *pmdev =3D PMBUS_DEVICE(smd);
> >       PMBusDeviceClass *pmdc =3D PMBUS_DEVICE_GET_CLASS(pmdev);
> >       uint8_t ret =3D 0xFF;
> > -    uint8_t index =3D pmdev->page;
> > +    uint8_t index;
> >
> >       if (pmdev->out_buf_len !=3D 0) {
> >           ret =3D pmbus_out_buf_pop(pmdev);
> >           return ret;
> >       }
> >
> > +    /*
> > +     * Reading from all pages will return the value from page 0,
> > +     * this is unspecified behaviour in general.
> > +     */
> > +    if (pmdev->page =3D=3D PB_ALL_PAGES) {
> > +        index =3D 0;
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: tried to read from all pages\n",
> > +                      __func__);
> > +        pmbus_cml_error(pmdev);
> > +    } else if (pmdev->page > pmdev->num_pages - 1) {
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: page %d is out of range\n",
> > +                      __func__, pmdev->page);
> > +        pmbus_cml_error(pmdev);
> > +        return -1;
>
> This file returns a mix of 0xFF/-1 for error. It would be nice
> to pick one. Adding a definition (PMBUS_ERR_BYTE?) could help.
>
> Preferably with error unified:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

