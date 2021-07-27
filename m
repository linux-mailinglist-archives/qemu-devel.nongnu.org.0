Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB8D3D74B2
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 14:03:20 +0200 (CEST)
Received: from localhost ([::1]:58098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Lnr-000057-07
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 08:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m8LmD-0007mS-1Y
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 08:01:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m8Lm9-0004cE-2y
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 08:01:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627387291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1uewP9SuqBR1wNBzs5V+qvr9Xn8ucgSJN2vauHiPXAM=;
 b=C6jE9IGJDOYQMDfpTa+6fU2NFvpzLcmh07EGO+fBk9SBuS6lRE8zAGQQI0uOK/FzQSSdw4
 QZ98uJJdi0HmVI9knGsnCijVW2hufno6cUdMLi9t7hGoDeWsZG0Vly7lPDHm7YHsvSOcSL
 fiVptjGang+ii0xfdYt/2VX/y1GNVII=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-YSJrR_FcOQudreC0TFpKyA-1; Tue, 27 Jul 2021 08:01:29 -0400
X-MC-Unique: YSJrR_FcOQudreC0TFpKyA-1
Received: by mail-wm1-f71.google.com with SMTP id
 k13-20020a05600c1c8db029025018ac4f7dso1276305wms.2
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 05:01:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1uewP9SuqBR1wNBzs5V+qvr9Xn8ucgSJN2vauHiPXAM=;
 b=hNx6jQdan2szJ/5FGzYmnrjs4fcWz/nkCKNt2EpM8thdDbWIBoHSMRDo0Hk8HCyK7t
 eaXGs9yLKcIDMOiFdTjMVuo2pxiveUsVbyoBJFvdbDvBQAKSDL1ggnIj3TRjzUNirO6U
 Q0XPPXTQ/1JIglrE8iBtkWYPTTAXl51+EuCbnAYOTgZRQhnF65OqdrMBiAeZhZaax1QB
 6gTydvtK9D2FYyZSpAHcLzY0vSBlVO+6J8f41sHydYbDFzih4qJ+3cLGhz8+LWxyvsh+
 mWNzPscRyxbvT6xlSlV/yNq0hOOV4TBXZExZvBAX6yTD/yAB+LnfPY4G3C7N3xnbKKUX
 mhIQ==
X-Gm-Message-State: AOAM533deLxtpEsYf9VGJTI4ON1I46qbNH05ul7q889SQuppq6EXBdZD
 y5mSszp5+5MkoGMiU4A8LkxrIYeCJ0QI63KP28A59htQCtqSX04GhtMaiCAIzhOC9tquAln9b98
 ZajBLKB4QfIzKly8=
X-Received: by 2002:a05:600c:21c2:: with SMTP id
 x2mr14334645wmj.61.1627387288825; 
 Tue, 27 Jul 2021 05:01:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEQtpUMyScwot1W2PacjDPutSVLToL+3G8Mp2HtlU1UeIcdUo6WZnflUj69MILr+KrzejK6w==
X-Received: by 2002:a05:600c:21c2:: with SMTP id
 x2mr14334604wmj.61.1627387288536; 
 Tue, 27 Jul 2021 05:01:28 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id w185sm2791674wmb.11.2021.07.27.05.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 05:01:28 -0700 (PDT)
Date: Tue, 27 Jul 2021 14:01:27 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v5 06/10] ACPI ERST: build the ACPI ERST table
Message-ID: <20210727140127.3c97ef2f@redhat.com>
In-Reply-To: <078e48aa-e6eb-44a8-c60f-7bc5a64c5e1c@oracle.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-7-git-send-email-eric.devolder@oracle.com>
 <20210720151640.2d682f57@redhat.com>
 <b6e963a3-a5d0-5029-6059-b89d7e16482b@oracle.com>
 <20210726130040.2cb8f717@redhat.com>
 <078e48aa-e6eb-44a8-c60f-7bc5a64c5e1c@oracle.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Jul 2021 15:02:55 -0500
Eric DeVolder <eric.devolder@oracle.com> wrote:

[...]
> >>>> +            build_serialization_instruction_entry(table_data, actio=
n,
> >>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> >>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> >>>> +            break;
> >>>> +        case ACPI_ERST_ACTION_BEGIN_READ_OPERATION:
> >>>> +            build_serialization_instruction_entry(table_data, actio=
n,
> >>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> >>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> >>>> +            break;
> >>>> +        case ACPI_ERST_ACTION_BEGIN_CLEAR_OPERATION:
> >>>> +            build_serialization_instruction_entry(table_data, actio=
n,
> >>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> >>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> >>>> +            break;
> >>>> +        case ACPI_ERST_ACTION_END_OPERATION:
> >>>> +            build_serialization_instruction_entry(table_data, actio=
n,
> >>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> >>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> >>>> +            break;
> >>>> +        case ACPI_ERST_ACTION_SET_RECORD_OFFSET:
> >>>> +            build_serialization_instruction_entry(table_data, actio=
n,
> >>>> +                ACPI_ERST_INST_WRITE_REGISTER      , 0, 32,
> >>>> +                s->bar0 + ERST_CSR_VALUE , 0, MASK32);
> >>>> +            build_serialization_instruction_entry(table_data, actio=
n,
> >>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> >>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> >>>> +            break;
> >>>> +        case ACPI_ERST_ACTION_EXECUTE_OPERATION:
> >>>> +            build_serialization_instruction_entry(table_data, actio=
n,
> >>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> >>>> +                s->bar0 + ERST_CSR_VALUE , ERST_EXECUTE_OPERATION_M=
AGIC, MASK8);
> >>>> +            build_serialization_instruction_entry(table_data, actio=
n,
> >>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> >>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> >>>> +            break;
> >>>> +        case ACPI_ERST_ACTION_CHECK_BUSY_STATUS:
> >>>> +            build_serialization_instruction_entry(table_data, actio=
n,
> >>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> >>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> >>>> +            build_serialization_instruction_entry(table_data, actio=
n,
> >>>> +                ACPI_ERST_INST_READ_REGISTER_VALUE , 0, 32,
> >>>> +                s->bar0 + ERST_CSR_VALUE, 0x01, MASK8);
> >>>> +            break;
> >>>> +        case ACPI_ERST_ACTION_GET_COMMAND_STATUS:
> >>>> +            build_serialization_instruction_entry(table_data, actio=
n,
> >>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> >>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> >>>> +            build_serialization_instruction_entry(table_data, actio=
n,
> >>>> +                ACPI_ERST_INST_READ_REGISTER       , 0, 32,
> >>>> +                s->bar0 + ERST_CSR_VALUE, 0, MASK8);
> >>>> +            break;
> >>>> +        case ACPI_ERST_ACTION_GET_RECORD_IDENTIFIER:
> >>>> +            build_serialization_instruction_entry(table_data, actio=
n,
> >>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> >>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> >>>> +            build_serialization_instruction_entry(table_data, actio=
n,
> >>>> +                ACPI_ERST_INST_READ_REGISTER       , 0, 64,
> >>>> +                s->bar0 + ERST_CSR_VALUE, 0, MASK64);
> >>>> +            break;
> >>>> +        case ACPI_ERST_ACTION_SET_RECORD_IDENTIFIER:
> >>>> +            build_serialization_instruction_entry(table_data, actio=
n,
> >>>> +                ACPI_ERST_INST_WRITE_REGISTER      , 0, 64,
> >>>> +                s->bar0 + ERST_CSR_VALUE , 0, MASK64);
> >>>> +            build_serialization_instruction_entry(table_data, actio=
n,
> >>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> >>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> >>>> +            break;
> >>>> +        case ACPI_ERST_ACTION_GET_RECORD_COUNT:
> >>>> +            build_serialization_instruction_entry(table_data, actio=
n,
> >>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> >>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> >>>> +            build_serialization_instruction_entry(table_data, actio=
n,
> >>>> +                ACPI_ERST_INST_READ_REGISTER       , 0, 32,
> >>>> +                s->bar0 + ERST_CSR_VALUE, 0, MASK32);
> >>>> +            break;
> >>>> +        case ACPI_ERST_ACTION_BEGIN_DUMMY_WRITE_OPERATION:
> >>>> +            build_serialization_instruction_entry(table_data, actio=
n,
> >>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> >>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> >>>> +            break;
> >>>> +        case ACPI_ERST_ACTION_RESERVED:
> >>>> +            build_serialization_instruction_entry(table_data, actio=
n,
> >>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> >>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> >>>> +            break;
> >>>> +        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE:
> >>>> +            build_serialization_instruction_entry(table_data, actio=
n,
> >>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> >>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> >>>> +            build_serialization_instruction_entry(table_data, actio=
n,
> >>>> +                ACPI_ERST_INST_READ_REGISTER       , 0, 64,
> >>>> +                s->bar0 + ERST_CSR_VALUE, 0, MASK64);
> >>>> +            break;
> >>>> +        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_LENGTH:
> >>>> +            build_serialization_instruction_entry(table_data, actio=
n,
> >>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> >>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> >>>> +            build_serialization_instruction_entry(table_data, actio=
n,
> >>>> +                ACPI_ERST_INST_READ_REGISTER       , 0, 64,
> >>>> +                s->bar0 + ERST_CSR_VALUE, 0, MASK32);
> >>>> +            break;
> >>>> +        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTE=
S:
> >>>> +            build_serialization_instruction_entry(table_data, actio=
n,
> >>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> >>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> >>>> +            build_serialization_instruction_entry(table_data, actio=
n,
> >>>> +                ACPI_ERST_INST_READ_REGISTER       , 0, 32,
> >>>> +                s->bar0 + ERST_CSR_VALUE, 0, MASK32);
> >>>> +            break;
> >>>> +        case ACPI_ERST_ACTION_GET_EXECUTE_OPERATION_TIMINGS:
> >>>> +            build_serialization_instruction_entry(table_data, actio=
n,
> >>>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
> >>>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
> >>>> +            build_serialization_instruction_entry(table_data, actio=
n,
> >>>> +                ACPI_ERST_INST_READ_REGISTER       , 0, 64,
> >>>> +                s->bar0 + ERST_CSR_VALUE, 0, MASK64);
> >>>> +        default:
> >>>> +            build_serialization_instruction_entry(table_data, actio=
n,
> >>>> +                ACPI_ERST_INST_NOOP, 0, 0, 0, action, 0);
> >>>> +            break;
> >>>> +        }

../../builds/imammedo/qemu/hw/acpi/erst.c: In function =E2=80=98build_erst=
=E2=80=99:
../../builds/imammedo/qemu/hw/acpi/erst.c:754:13: error: this statement may=
 fall through [-Werror=3Dimplicit-fallthrough=3D]
             build_serialization_instruction_entry(table_data, action,
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ACPI_ERST_INST_READ_REGISTER       , 0, 64,
                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 s->bar0 + ERST_CSR_VALUE, 0, MASK64);
                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../../builds/imammedo/qemu/hw/acpi/erst.c:757:9: note: here
         default:
         ^~~~~~~
cc1: all warnings being treated as errors


> >>>> +    }
> >>>> +    build_header(linker, table_data,
> >>>> +                 (void *)(table_data->data + erst_start),
> >>>> +                 "ERST", table_data->len - erst_start,
> >>>> +                 1, oem_id, oem_table_id);
> >>>> +}
> >>>> +
> >>>> +/******************************************************************=
*/
> >>>> +/******************************************************************=
*/
> >>>> +
> >>>>    static const VMStateDescription erst_vmstate  =3D {
> >>>>        .name =3D "acpi-erst",
> >>>>        .version_id =3D 1, =20
> >>>     =20
> >> =20
> >  =20
>=20


