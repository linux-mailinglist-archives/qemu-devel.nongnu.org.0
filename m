Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BA42DDD9F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 05:09:16 +0100 (CET)
Received: from localhost ([::1]:36540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq74t-0003dF-HI
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 23:09:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scw@google.com>) id 1kq6zI-0000R7-Sk
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 23:03:28 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:42624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <scw@google.com>) id 1kq6zF-0004go-Pk
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 23:03:28 -0500
Received: by mail-ed1-x533.google.com with SMTP id g24so925018edw.9
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 20:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ppSHDJLO/wBVt5I+URGF8PQo8HBlRg0JWV2Y62bc8N4=;
 b=My49wy9zEcQeqgoyrf/nMZZcRWYJBa0zrURdtHkyekzfZQSLSdvqZvnpHIlev0QtTd
 qpp6g4etjjfnV+6d/JTFzdB2Jeu55tm3KdhV1q32+RbCRGn0Z5FzaWny/lYI9fyAEpIz
 NrigpkX9RCqQDcm8pPf2agxWLSte9KC1M3J5bdeDi3jV/zwzjWGowgGCGmsqFODUCZIn
 OgoWTp1CTVzj6fBihfDGmozfF9Lvc8WfCQYisYdsCmgGIghxUomKIbYE8mWq/MO/0LD6
 hlXGCjGUTw2WhQ0JVJcggG2n5pe2eU1jpo0lqYrJIM4UqYpQvMTtuAxSQ34Ih3wMZU6a
 QtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ppSHDJLO/wBVt5I+URGF8PQo8HBlRg0JWV2Y62bc8N4=;
 b=CkDzC570oaj2MocVRNMB8Fu3lRe3mpWjMzwPMKSCR38qli2OdHKlKlexjvXdctCJnh
 9A2tdehbZEcc48GGLkBr9AyvII6VF5y2uV7p4F7V5ZcFJJUP13e5AvNc6fegzO4UmS1Z
 3TOOz+nOO2VYBy/PPVXZnMCh70uId2bcKFExq7tdZnoJSj8N3y+DCpPiG4qgaIfarPNs
 YiF4llaMLsQrZT7iGWTiZpcOpnAGdhxpEvM7a/vMpHOJkdBadwS/UQScCDBGv+NGVYJi
 YVGs5fZUaRSAVw6FVgNqG5fMwFZ3gSKo1X4iz4RuVlCEZC+Durlr4Kuv8h69EsMJFUQh
 EoCw==
X-Gm-Message-State: AOAM53221tvxFsvXlyLVdGbMx1fNeHutCTP7/07/8PPE7A8genXPdEZM
 aGC8dMIVpTcn7fx9x3ygjti3YaXChpZy4NNBCVdH3i9J/M+n0rx4
X-Google-Smtp-Source: ABdhPJzfrK2zATIFcOMHkpX9LwgDx5rfV4advMq0wzI5bS2n03ASPEFkJz6rz/GjZDsgq+eAxm26d7hBeZfcb/wINVk=
X-Received: by 2002:a05:6402:411:: with SMTP id
 q17mr2520972edv.125.1608264203890; 
 Thu, 17 Dec 2020 20:03:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1597129029.git.scw@google.com>
 <e0754f52180aee6418eae8b3b8aa5981fcac12fd.1597129029.git.scw@google.com>
 <CAF3nBxgAxd2=8vNQM8AGzfojjoaB-r5TKn7Emw8yZVL1aiB=Lg@mail.gmail.com>
In-Reply-To: <CAF3nBxgAxd2=8vNQM8AGzfojjoaB-r5TKn7Emw8yZVL1aiB=Lg@mail.gmail.com>
From: Shu-Chun Weng <scw@google.com>
Date: Thu, 17 Dec 2020 20:03:12 -0800
Message-ID: <CAF3nBxhKRpyFf593n7SbXPeM+4wkJjTZVmy8bvhVTHrY2hNZRQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] thunk: supports flexible arrays
To: qemu-devel@nongnu.org, Riku Voipio <riku.voipio@iki.fi>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="0000000000009a59d605b6b530ec"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=scw@google.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009a59d605b6b530ec
Content-Type: multipart/alternative; boundary="000000000000946a4305b6b53084"

--000000000000946a4305b6b53084
Content-Type: text/plain; charset="UTF-8"

Ping -- any comments on
https://patchew.org/QEMU/cover.1597129029.git.scw@google.com/e0754f52180aee6418eae8b3b8aa5981fcac12fd.1597129029.git.scw@google.com/

On Tue, Aug 11, 2020 at 2:39 PM Shu-Chun Weng <scw@google.com> wrote:

> Forgot to +riku.voipio@iki.fi when generating v2.
>
> On Tue, Aug 11, 2020 at 12:10 AM Shu-Chun Weng <scw@google.com> wrote:
>
>> Flexible arrays may appear in the last field of a struct and are heavily
>> used in the ioctl(SIOCETHTOOL) system call on Linux. E.g.
>>
>>   struct ethtool_regs {
>>       __u32   cmd;
>>       __u32   version; /* driver-specific, indicates different chips/revs
>> */
>>       __u32   len; /* bytes */
>>       __u8    data[0];
>>   };
>>
>> where number of elements in `data` is specified in `len`. It is translated
>> into:
>>
>>   STRUCT(ethtool_regs,
>>          TYPE_INT, /* cmd */
>>          TYPE_INT, /* version */
>>          TYPE_INT, /* len */
>>          MK_FLEXIBLE_ARRAY(TYPE_CHAR, 2)) /* data[0]: len */
>>
>> where the "2" passed to `MK_FLEXIBLE_ARRAY` means the number of element
>> is specified by field number 2 (0-index).
>>
>> Signed-off-by: Shu-Chun Weng <scw@google.com>
>> ---
>> v1 -> v2:
>>   Fix style problems.
>>
>>  include/exec/user/thunk.h |  24 ++++++
>>  thunk.c                   | 152 +++++++++++++++++++++++++++++++++++++-
>>  2 files changed, 174 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/exec/user/thunk.h b/include/exec/user/thunk.h
>> index 7992475c9f..d0d7c83f1f 100644
>> --- a/include/exec/user/thunk.h
>> +++ b/include/exec/user/thunk.h
>> @@ -39,12 +39,21 @@ typedef enum argtype {
>>      TYPE_ARRAY,
>>      TYPE_STRUCT,
>>      TYPE_OLDDEVT,
>> +    TYPE_FLEXIBLE_ARRAY,
>>  } argtype;
>>
>>  #define MK_PTR(type) TYPE_PTR, type
>>  #define MK_ARRAY(type, size) TYPE_ARRAY, size, type
>>  #define MK_STRUCT(id) TYPE_STRUCT, id
>>
>> +/*
>> + * Should only appear as the last element of a TYPE_STRUCT.
>> `len_field_idx` is
>> + * the index into the fields in the enclosing struct that specify the
>> length of
>> + * the flexibly array. The length field MUST be a TYPE_INT field.
>> + */
>> +#define MK_FLEXIBLE_ARRAY(type, len_field_idx) \
>> +    TYPE_FLEXIBLE_ARRAY, (len_field_idx), type
>> +
>>  #define THUNK_TARGET 0
>>  #define THUNK_HOST   1
>>
>> @@ -55,6 +64,8 @@ typedef struct {
>>      int *field_offsets[2];
>>      /* special handling */
>>      void (*convert[2])(void *dst, const void *src);
>> +    int (*thunk_size[2])(const void *src);
>> +
>>      int size[2];
>>      int align[2];
>>      const char *name;
>> @@ -75,6 +86,11 @@ const argtype *thunk_convert(void *dst, const void
>> *src,
>>                               const argtype *type_ptr, int to_host);
>>  const argtype *thunk_print(void *arg, const argtype *type_ptr);
>>
>> +bool thunk_type_has_flexible_array(const argtype *type_ptr);
>> +/* thunk_type_size but can handle TYPE_FLEXIBLE_ARRAY */
>> +int thunk_type_size_with_src(const void *src, const argtype *type_ptr,
>> +                             int is_host);
>> +
>>  extern StructEntry *struct_entries;
>>
>>  int thunk_type_size_array(const argtype *type_ptr, int is_host);
>> @@ -137,6 +153,12 @@ static inline int thunk_type_size(const argtype
>> *type_ptr, int is_host)
>>      case TYPE_STRUCT:
>>          se = struct_entries + type_ptr[1];
>>          return se->size[is_host];
>> +    case TYPE_FLEXIBLE_ARRAY:
>> +        /*
>> +         * Flexible arrays do not count toward sizeof(). Users of
>> structures
>> +         * containing them need to calculate it themselves.
>> +         */
>> +        return 0;
>>      default:
>>          g_assert_not_reached();
>>      }
>> @@ -187,6 +209,8 @@ static inline int thunk_type_align(const argtype
>> *type_ptr, int is_host)
>>      case TYPE_STRUCT:
>>          se = struct_entries + type_ptr[1];
>>          return se->align[is_host];
>> +    case TYPE_FLEXIBLE_ARRAY:
>> +        return thunk_type_align_array(type_ptr + 2, is_host);
>>      default:
>>          g_assert_not_reached();
>>      }
>> diff --git a/thunk.c b/thunk.c
>> index c5d9719747..d9c6cba3bd 100644
>> --- a/thunk.c
>> +++ b/thunk.c
>> @@ -50,6 +50,8 @@ static inline const argtype *thunk_type_next(const
>> argtype *type_ptr)
>>          return thunk_type_next_ptr(type_ptr + 1);
>>      case TYPE_STRUCT:
>>          return type_ptr + 1;
>> +    case TYPE_FLEXIBLE_ARRAY:
>> +        return thunk_type_next_ptr(type_ptr + 1);
>>      default:
>>          return NULL;
>>      }
>> @@ -122,6 +124,34 @@ void thunk_register_struct_direct(int id, const char
>> *name,
>>      se->name = name;
>>  }
>>
>> +static const argtype *
>> +thunk_convert_flexible_array(void *dst, const void *src,
>> +                             const uint8_t *dst_struct,
>> +                             const uint8_t *src_struct, const argtype
>> *type_ptr,
>> +                             const StructEntry *se, int to_host) {
>> +    int len_field_idx, dst_size, src_size, i;
>> +    uint32_t array_length;
>> +    uint8_t *d;
>> +    const uint8_t *s;
>> +
>> +    assert(*type_ptr == TYPE_FLEXIBLE_ARRAY);
>> +    type_ptr++;
>> +    len_field_idx = *type_ptr++;
>> +    array_length =
>> +        *(const uint32_t *)(to_host ?
>> +                            dst_struct +
>> se->field_offsets[1][len_field_idx] :
>> +                            src_struct +
>> se->field_offsets[0][len_field_idx]);
>> +    dst_size = thunk_type_size(type_ptr, to_host);
>> +    src_size = thunk_type_size(type_ptr, to_host);
>> +    d = dst;
>> +    s = src;
>> +    for (i = 0; i < array_length; i++) {
>> +        thunk_convert(d, s, type_ptr, to_host);
>> +        d += dst_size;
>> +        s += src_size;
>> +    }
>> +    return thunk_type_next(type_ptr);
>> +}
>>
>>  /* now we can define the main conversion functions */
>>  const argtype *thunk_convert(void *dst, const void *src,
>> @@ -246,7 +276,7 @@ const argtype *thunk_convert(void *dst, const void
>> *src,
>>
>>              assert(*type_ptr < max_struct_entries);
>>              se = struct_entries + *type_ptr++;
>> -            if (se->convert[0] != NULL) {
>> +            if (se->convert[to_host] != NULL) {
>>                  /* specific conversion is needed */
>>                  (*se->convert[to_host])(dst, src);
>>              } else {
>> @@ -256,7 +286,18 @@ const argtype *thunk_convert(void *dst, const void
>> *src,
>>                  src_offsets = se->field_offsets[1 - to_host];
>>                  d = dst;
>>                  s = src;
>> -                for(i = 0;i < se->nb_fields; i++) {
>> +                for (i = 0; i < se->nb_fields; i++) {
>> +                    if (*field_types == TYPE_FLEXIBLE_ARRAY) {
>> +                        field_types = thunk_convert_flexible_array(
>> +                            d + dst_offsets[i],
>> +                            s + src_offsets[i],
>> +                            d,
>> +                            s,
>> +                            field_types,
>> +                            se,
>> +                            to_host);
>> +                        continue;
>> +                    }
>>                      field_types = thunk_convert(d + dst_offsets[i],
>>                                                  s + src_offsets[i],
>>                                                  field_types, to_host);
>> @@ -264,6 +305,11 @@ const argtype *thunk_convert(void *dst, const void
>> *src,
>>              }
>>          }
>>          break;
>> +    case TYPE_FLEXIBLE_ARRAY:
>> +        fprintf(stderr,
>> +                "Invalid flexible array (type 0x%x) outside of a
>> structure\n",
>> +                type);
>> +        break;
>>      default:
>>          fprintf(stderr, "Invalid type 0x%x\n", type);
>>          break;
>> @@ -271,6 +317,45 @@ const argtype *thunk_convert(void *dst, const void
>> *src,
>>      return type_ptr;
>>  }
>>
>> +static const argtype *
>> +thunk_print_flexible_array(void *arg, const uint8_t *arg_struct,
>> +                           const argtype *type_ptr, const StructEntry
>> *se) {
>> +    int array_length, len_field_idx, arg_size, i;
>> +    uint8_t *a;
>> +    int is_string = 0;
>> +
>> +    assert(*type_ptr == TYPE_FLEXIBLE_ARRAY);
>> +    type_ptr++;
>> +    len_field_idx = *type_ptr++;
>> +
>> +    array_length = tswap32(
>> +        *(const uint32_t *)(arg_struct +
>> se->field_offsets[0][len_field_idx]));
>> +    arg_size = thunk_type_size(type_ptr, 0);
>> +    a = arg;
>> +
>> +    if (*type_ptr == TYPE_CHAR) {
>> +        qemu_log("\"");
>> +        is_string = 1;
>> +    } else {
>> +        qemu_log("[");
>> +    }
>> +
>> +    for (i = 0; i < array_length; i++) {
>> +        if (i > 0 && !is_string) {
>> +            qemu_log(",");
>> +        }
>> +        thunk_print(a, type_ptr);
>> +        a += arg_size;
>> +    }
>> +
>> +    if (is_string) {
>> +        qemu_log("\"");
>> +    } else {
>> +        qemu_log("]");
>> +    }
>> +    return thunk_type_next(type_ptr);
>> +}
>> +
>>  const argtype *thunk_print(void *arg, const argtype *type_ptr)
>>  {
>>      int type;
>> @@ -414,17 +499,80 @@ const argtype *thunk_print(void *arg, const argtype
>> *type_ptr)
>>                  if (i > 0) {
>>                      qemu_log(",");
>>                  }
>> +                if (*field_types == TYPE_FLEXIBLE_ARRAY) {
>> +                    field_types = thunk_print_flexible_array(
>> +                        a + arg_offsets[i], a, field_types, se);
>> +                    continue;
>> +                }
>>                  field_types = thunk_print(a + arg_offsets[i],
>> field_types);
>>              }
>>              qemu_log("}");
>>          }
>>          break;
>> +    case TYPE_FLEXIBLE_ARRAY:
>> +        fprintf(stderr,
>> +                "Invalid flexible array (type 0x%x) outside of a
>> structure\n",
>> +                type);
>> +        break;
>>      default:
>>          g_assert_not_reached();
>>      }
>>      return type_ptr;
>>  }
>>
>> +bool thunk_type_has_flexible_array(const argtype *type_ptr)
>> +{
>> +  int i;
>> +  const StructEntry *se;
>> +  const argtype *field_types;
>> +    if (*type_ptr != TYPE_STRUCT) {
>> +        return false;
>> +    }
>> +    se = struct_entries + type_ptr[1];
>> +    field_types = se->field_types;
>> +    for (i = 0; i < se->nb_fields; i++) {
>> +        if (*field_types == TYPE_FLEXIBLE_ARRAY) {
>> +            return true;
>> +        }
>> +        field_types = thunk_type_next(type_ptr);
>> +    }
>> +    return false;
>> +}
>> +
>> +int thunk_type_size_with_src(const void *src, const argtype *type_ptr,
>> +                             int is_host)
>> +{
>> +    switch (*type_ptr) {
>> +    case TYPE_STRUCT: {
>> +        int i;
>> +        const StructEntry *se = struct_entries + type_ptr[1];
>> +        const argtype *field_types;
>> +        if (se->thunk_size[is_host] != NULL) {
>> +            return (*se->thunk_size[is_host])(src);
>> +        }
>> +
>> +        field_types = se->field_types;
>> +        for (i = 0; i < se->nb_fields; i++) {
>> +            if (*field_types == TYPE_FLEXIBLE_ARRAY) {
>> +                uint32_t array_length = *(const uint32_t *)(
>> +                    (const uint8_t *)src +
>> +                    se->field_offsets[is_host][field_types[1]]);
>> +                if (!is_host) {
>> +                    array_length = tswap32(array_length);
>> +                }
>> +                return se->size[is_host] +
>> +                    array_length *
>> +                    thunk_type_size(field_types + 2, is_host);
>> +            }
>> +            field_types = thunk_type_next(type_ptr);
>> +        }
>> +        return se->size[is_host];
>> +    }
>> +    default:
>> +        return thunk_type_size(type_ptr, is_host);
>> +    }
>> +}
>> +
>>  /* from em86 */
>>
>>  /* Utility function: Table-driven functions to translate bitmasks
>> --
>> 2.28.0.220.ged08abb693-goog
>>
>>

--000000000000946a4305b6b53084
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping -- any comments on <a href=3D"https://patchew.org/QEM=
U/cover.1597129029.git.scw@google.com/e0754f52180aee6418eae8b3b8aa5981fcac1=
2fd.1597129029.git.scw@google.com/">https://patchew.org/QEMU/cover.15971290=
29.git.scw@google.com/e0754f52180aee6418eae8b3b8aa5981fcac12fd.1597129029.g=
it.scw@google.com/</a></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Tue, Aug 11, 2020 at 2:39 PM Shu-Chun Weng &lt;<a =
href=3D"mailto:scw@google.com">scw@google.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Forgot to +<s=
pan style=3D"font-family:Roboto,RobotoDraft,Helvetica,Arial,sans-serif;font=
-size:14px"><a href=3D"mailto:riku.voipio@iki.fi" target=3D"_blank">riku.vo=
ipio@iki.fi</a> when generating v2.</span><br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 11, 2020 at 12:10=
 AM Shu-Chun Weng &lt;<a href=3D"mailto:scw@google.com" target=3D"_blank">s=
cw@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Flexible arrays may appear in the last field of a struct and a=
re heavily<br>
used in the ioctl(SIOCETHTOOL) system call on Linux. E.g.<br>
<br>
=C2=A0 struct ethtool_regs {<br>
=C2=A0 =C2=A0 =C2=A0 __u32=C2=A0 =C2=A0cmd;<br>
=C2=A0 =C2=A0 =C2=A0 __u32=C2=A0 =C2=A0version; /* driver-specific, indicat=
es different chips/revs */<br>
=C2=A0 =C2=A0 =C2=A0 __u32=C2=A0 =C2=A0len; /* bytes */<br>
=C2=A0 =C2=A0 =C2=A0 __u8=C2=A0 =C2=A0 data[0];<br>
=C2=A0 };<br>
<br>
where number of elements in `data` is specified in `len`. It is translated<=
br>
into:<br>
<br>
=C2=A0 STRUCT(ethtool_regs,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* cmd */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* version */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* len */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MK_FLEXIBLE_ARRAY(TYPE_CHAR, 2)) /* data[=
0]: len */<br>
<br>
where the &quot;2&quot; passed to `MK_FLEXIBLE_ARRAY` means the number of e=
lement<br>
is specified by field number 2 (0-index).<br>
<br>
Signed-off-by: Shu-Chun Weng &lt;<a href=3D"mailto:scw@google.com" target=
=3D"_blank">scw@google.com</a>&gt;<br>
---<br>
v1 -&gt; v2:<br>
=C2=A0 Fix style problems.<br>
<br>
=C2=A0include/exec/user/thunk.h |=C2=A0 24 ++++++<br>
=C2=A0thunk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 152 +++++++++++++++++++++++++++++++++++++-<br>
=C2=A02 files changed, 174 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/include/exec/user/thunk.h b/include/exec/user/thunk.h<br>
index 7992475c9f..d0d7c83f1f 100644<br>
--- a/include/exec/user/thunk.h<br>
+++ b/include/exec/user/thunk.h<br>
@@ -39,12 +39,21 @@ typedef enum argtype {<br>
=C2=A0 =C2=A0 =C2=A0TYPE_ARRAY,<br>
=C2=A0 =C2=A0 =C2=A0TYPE_STRUCT,<br>
=C2=A0 =C2=A0 =C2=A0TYPE_OLDDEVT,<br>
+=C2=A0 =C2=A0 TYPE_FLEXIBLE_ARRAY,<br>
=C2=A0} argtype;<br>
<br>
=C2=A0#define MK_PTR(type) TYPE_PTR, type<br>
=C2=A0#define MK_ARRAY(type, size) TYPE_ARRAY, size, type<br>
=C2=A0#define MK_STRUCT(id) TYPE_STRUCT, id<br>
<br>
+/*<br>
+ * Should only appear as the last element of a TYPE_STRUCT. `len_field_idx=
` is<br>
+ * the index into the fields in the enclosing struct that specify the leng=
th of<br>
+ * the flexibly array. The length field MUST be a TYPE_INT field.<br>
+ */<br>
+#define MK_FLEXIBLE_ARRAY(type, len_field_idx) \<br>
+=C2=A0 =C2=A0 TYPE_FLEXIBLE_ARRAY, (len_field_idx), type<br>
+<br>
=C2=A0#define THUNK_TARGET 0<br>
=C2=A0#define THUNK_HOST=C2=A0 =C2=A01<br>
<br>
@@ -55,6 +64,8 @@ typedef struct {<br>
=C2=A0 =C2=A0 =C2=A0int *field_offsets[2];<br>
=C2=A0 =C2=A0 =C2=A0/* special handling */<br>
=C2=A0 =C2=A0 =C2=A0void (*convert[2])(void *dst, const void *src);<br>
+=C2=A0 =C2=A0 int (*thunk_size[2])(const void *src);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0int size[2];<br>
=C2=A0 =C2=A0 =C2=A0int align[2];<br>
=C2=A0 =C2=A0 =C2=A0const char *name;<br>
@@ -75,6 +86,11 @@ const argtype *thunk_convert(void *dst, const void *src,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const argtype *type_ptr, int to_host);<br>
=C2=A0const argtype *thunk_print(void *arg, const argtype *type_ptr);<br>
<br>
+bool thunk_type_has_flexible_array(const argtype *type_ptr);<br>
+/* thunk_type_size but can handle TYPE_FLEXIBLE_ARRAY */<br>
+int thunk_type_size_with_src(const void *src, const argtype *type_ptr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int is_host);<br>
+<br>
=C2=A0extern StructEntry *struct_entries;<br>
<br>
=C2=A0int thunk_type_size_array(const argtype *type_ptr, int is_host);<br>
@@ -137,6 +153,12 @@ static inline int thunk_type_size(const argtype *type_=
ptr, int is_host)<br>
=C2=A0 =C2=A0 =C2=A0case TYPE_STRUCT:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0se =3D struct_entries + type_ptr[1];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return se-&gt;size[is_host];<br>
+=C2=A0 =C2=A0 case TYPE_FLEXIBLE_ARRAY:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Flexible arrays do not count toward si=
zeof(). Users of structures<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* containing them need to calculate it t=
hemselves.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_not_reached();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -187,6 +209,8 @@ static inline int thunk_type_align(const argtype *type_=
ptr, int is_host)<br>
=C2=A0 =C2=A0 =C2=A0case TYPE_STRUCT:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0se =3D struct_entries + type_ptr[1];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return se-&gt;align[is_host];<br>
+=C2=A0 =C2=A0 case TYPE_FLEXIBLE_ARRAY:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return thunk_type_align_array(type_ptr + 2, is=
_host);<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_not_reached();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/thunk.c b/thunk.c<br>
index c5d9719747..d9c6cba3bd 100644<br>
--- a/thunk.c<br>
+++ b/thunk.c<br>
@@ -50,6 +50,8 @@ static inline const argtype *thunk_type_next(const argtyp=
e *type_ptr)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return thunk_type_next_ptr(type_ptr + 1);=
<br>
=C2=A0 =C2=A0 =C2=A0case TYPE_STRUCT:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return type_ptr + 1;<br>
+=C2=A0 =C2=A0 case TYPE_FLEXIBLE_ARRAY:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return thunk_type_next_ptr(type_ptr + 1);<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -122,6 +124,34 @@ void thunk_register_struct_direct(int id, const char *=
name,<br>
=C2=A0 =C2=A0 =C2=A0se-&gt;name =3D name;<br>
=C2=A0}<br>
<br>
+static const argtype *<br>
+thunk_convert_flexible_array(void *dst, const void *src,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const uint8_t *dst_struct,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const uint8_t *src_struct, const argtype *ty=
pe_ptr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const StructEntry *se, int to_host) {<br>
+=C2=A0 =C2=A0 int len_field_idx, dst_size, src_size, i;<br>
+=C2=A0 =C2=A0 uint32_t array_length;<br>
+=C2=A0 =C2=A0 uint8_t *d;<br>
+=C2=A0 =C2=A0 const uint8_t *s;<br>
+<br>
+=C2=A0 =C2=A0 assert(*type_ptr =3D=3D TYPE_FLEXIBLE_ARRAY);<br>
+=C2=A0 =C2=A0 type_ptr++;<br>
+=C2=A0 =C2=A0 len_field_idx =3D *type_ptr++;<br>
+=C2=A0 =C2=A0 array_length =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *(const uint32_t *)(to_host ?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 dst_struct + se-&gt;field_offsets[1][len_field_idx=
] :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 src_struct + se-&gt;field_offsets[0][len_field_idx=
]);<br>
+=C2=A0 =C2=A0 dst_size =3D thunk_type_size(type_ptr, to_host);<br>
+=C2=A0 =C2=A0 src_size =3D thunk_type_size(type_ptr, to_host);<br>
+=C2=A0 =C2=A0 d =3D dst;<br>
+=C2=A0 =C2=A0 s =3D src;<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; array_length; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 thunk_convert(d, s, type_ptr, to_host);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d +=3D dst_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s +=3D src_size;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return thunk_type_next(type_ptr);<br>
+}<br>
<br>
=C2=A0/* now we can define the main conversion functions */<br>
=C2=A0const argtype *thunk_convert(void *dst, const void *src,<br>
@@ -246,7 +276,7 @@ const argtype *thunk_convert(void *dst, const void *src=
,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(*type_ptr &lt; max_s=
truct_entries);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0se =3D struct_entries + *ty=
pe_ptr++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (se-&gt;convert[0] !=3D NULL)=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (se-&gt;convert[to_host] !=3D=
 NULL) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* specific c=
onversion is needed */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(*se-&gt;conv=
ert[to_host])(dst, src);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
@@ -256,7 +286,18 @@ const argtype *thunk_convert(void *dst, const void *sr=
c,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0src_offsets =
=3D se-&gt;field_offsets[1 - to_host];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d =3D dst;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s =3D src;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for(i =3D 0;i &lt;=
 se-&gt;nb_fields; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &l=
t; se-&gt;nb_fields; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=
*field_types =3D=3D TYPE_FLEXIBLE_ARRAY) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 field_types =3D thunk_convert_flexible_array(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 d + dst_offsets[i],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 s + src_offsets[i],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 d,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 s,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 field_types,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 se,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 to_host);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0field_types =3D thunk_convert(d + dst_offsets[i],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0s + src_offsets[i],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0field_types, to_host);<br>
@@ -264,6 +305,11 @@ const argtype *thunk_convert(void *dst, const void *sr=
c,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 case TYPE_FLEXIBLE_ARRAY:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Invalid flex=
ible array (type 0x%x) outside of a structure\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;Invalid type 0x%x\n=
&quot;, type);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
@@ -271,6 +317,45 @@ const argtype *thunk_convert(void *dst, const void *sr=
c,<br>
=C2=A0 =C2=A0 =C2=A0return type_ptr;<br>
=C2=A0}<br>
<br>
+static const argtype *<br>
+thunk_print_flexible_array(void *arg, const uint8_t *arg_struct,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0const argtype *type_ptr, const StructEntry *se) {<b=
r>
+=C2=A0 =C2=A0 int array_length, len_field_idx, arg_size, i;<br>
+=C2=A0 =C2=A0 uint8_t *a;<br>
+=C2=A0 =C2=A0 int is_string =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 assert(*type_ptr =3D=3D TYPE_FLEXIBLE_ARRAY);<br>
+=C2=A0 =C2=A0 type_ptr++;<br>
+=C2=A0 =C2=A0 len_field_idx =3D *type_ptr++;<br>
+<br>
+=C2=A0 =C2=A0 array_length =3D tswap32(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *(const uint32_t *)(arg_struct + se-&gt;field_=
offsets[0][len_field_idx]));<br>
+=C2=A0 =C2=A0 arg_size =3D thunk_type_size(type_ptr, 0);<br>
+=C2=A0 =C2=A0 a =3D arg;<br>
+<br>
+=C2=A0 =C2=A0 if (*type_ptr =3D=3D TYPE_CHAR) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;\&quot;&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_string =3D 1;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;[&quot;);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; array_length; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt; 0 &amp;&amp; !is_string) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;,&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 thunk_print(a, type_ptr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 a +=3D arg_size;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (is_string) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;\&quot;&quot;);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;]&quot;);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return thunk_type_next(type_ptr);<br>
+}<br>
+<br>
=C2=A0const argtype *thunk_print(void *arg, const argtype *type_ptr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int type;<br>
@@ -414,17 +499,80 @@ const argtype *thunk_print(void *arg, const argtype *=
type_ptr)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i &gt; 0)=
 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0qemu_log(&quot;,&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*field_types =
=3D=3D TYPE_FLEXIBLE_ARRAY) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fiel=
d_types =3D thunk_print_flexible_array(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 a + arg_offsets[i], a, field_types, se);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cont=
inue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0field_types =
=3D thunk_print(a + arg_offsets[i], field_types);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log(&quot;}&quot;);<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 case TYPE_FLEXIBLE_ARRAY:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Invalid flex=
ible array (type 0x%x) outside of a structure\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_not_reached();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return type_ptr;<br>
=C2=A0}<br>
<br>
+bool thunk_type_has_flexible_array(const argtype *type_ptr)<br>
+{<br>
+=C2=A0 int i;<br>
+=C2=A0 const StructEntry *se;<br>
+=C2=A0 const argtype *field_types;<br>
+=C2=A0 =C2=A0 if (*type_ptr !=3D TYPE_STRUCT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 se =3D struct_entries + type_ptr[1];<br>
+=C2=A0 =C2=A0 field_types =3D se-&gt;field_types;<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; se-&gt;nb_fields; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*field_types =3D=3D TYPE_FLEXIBLE_ARRAY) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 field_types =3D thunk_type_next(type_ptr);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return false;<br>
+}<br>
+<br>
+int thunk_type_size_with_src(const void *src, const argtype *type_ptr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int is_host)<br>
+{<br>
+=C2=A0 =C2=A0 switch (*type_ptr) {<br>
+=C2=A0 =C2=A0 case TYPE_STRUCT: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 const StructEntry *se =3D struct_entries + typ=
e_ptr[1];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 const argtype *field_types;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (se-&gt;thunk_size[is_host] !=3D NULL) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (*se-&gt;thunk_size[is_ho=
st])(src);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 field_types =3D se-&gt;field_types;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; se-&gt;nb_fields; i++) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*field_types =3D=3D TYPE_FLE=
XIBLE_ARRAY) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t array_len=
gth =3D *(const uint32_t *)(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (con=
st uint8_t *)src +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 se-&=
gt;field_offsets[is_host][field_types[1]]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!is_host) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arra=
y_length =3D tswap32(array_length);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return se-&gt;size=
[is_host] +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arra=
y_length *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 thun=
k_type_size(field_types + 2, is_host);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 field_types =3D thunk_type_next(=
type_ptr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return se-&gt;size[is_host];<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return thunk_type_size(type_ptr, is_host);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
=C2=A0/* from em86 */<br>
<br>
=C2=A0/* Utility function: Table-driven functions to translate bitmasks<br>
-- <br>
2.28.0.220.ged08abb693-goog<br>
<br>
</blockquote></div>
</blockquote></div>

--000000000000946a4305b6b53084--

--0000000000009a59d605b6b530ec
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPkgYJKoZIhvcNAQcCoIIPgzCCD38CAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ggzsMIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA3MjgwMDAwMDBaFw0yOTAzMTgwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFIzIFNNSU1FIENBIDIwMjAwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvLe9xPU9W
dpiHLAvX7kFnaFZPuJLey7LYaMO8P/xSngB9IN73mVc7YiLov12Fekdtn5kL8PjmDBEvTYmWsuQS
6VBo3vdlqqXZ0M9eMkjcKqijrmDRleudEoPDzTumwQ18VB/3I+vbN039HIaRQ5x+NHGiPHVfk6Rx
c6KAbYceyeqqfuJEcq23vhTdium/Bf5hHqYUhuJwnBQ+dAUcFndUKMJrth6lHeoifkbw2bv81zxJ
I9cvIy516+oUekqiSFGfzAqByv41OrgLV4fLGCDH3yRh1tj7EtV3l2TngqtrDLUs5R+sWIItPa/4
AJXB1Q3nGNl2tNjVpcSn0uJ7aFPbAgMBAAGjggGKMIIBhjAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHzM
CmjXouseLHIb0c1dlW+N+/JjMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i3Ru8MHsGCCsG
AQUFBwEBBG8wbTAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3Ry
MzA7BggrBgEFBQcwAoYvaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvcm9vdC1y
My5jcnQwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIz
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
--0000000000009a59d605b6b530ec--

